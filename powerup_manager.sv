// used to store all the powerups as well as provided control signals to the rest of the modules

module powerup_manager (
    input  logic        clk,
    input  logic        reset,
    input  logic        enable_spawn,
    input  logic [19:0] outmaze [0:19],
    input  logic        pickedUp [0:2],
    input  logic        onWall,

    output logic [9:0]  powerupX [0:2],
    output logic [9:0]  powerupY [0:2],
    output logic [1:0]  powerupType [0:2],
    output logic        powerupVisible [0:2],

// control signals for "active" state
    output logic        speedBoost_active,
    output logic        tripleShot_active,
    output logic        wallPhase_active
);

    parameter TILE_WIDTH  = 32;
    parameter TILE_HEIGHT = 24;
    parameter MAZE_W = 20;
    parameter MAZE_H = 20;

    integer i;
    logic [4:0] rand_tile_x, rand_tile_y;
    logic [1:0] rand_type;

    // i used LFSR here to make the powerups spawn in pseudorandom way

    logic [4:0] lfsr_x, lfsr_y;
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            lfsr_x <= 5'b10011;
            lfsr_y <= 5'b11001;
        end else begin
            lfsr_x <= {lfsr_x[3:0], lfsr_x[4] ^ lfsr_x[2]};
            lfsr_y <= {lfsr_y[3:0], lfsr_y[4] ^ lfsr_y[1]};
        end
    end

    // Pickup flags
    logic pickedUp_speed, pickedUp_wallPhase, pickedUp_triple;
    always_comb begin
        pickedUp_speed = 0;
        pickedUp_wallPhase = 0;
        pickedUp_triple = 0;
        for (int j = 0; j < 3; j++) begin
            if (pickedUp[j] && powerupVisible[j]) begin
                case (powerupType[j])
                    2'd0: pickedUp_speed = 1;
                    2'd1: pickedUp_wallPhase = 1;
                    2'd2: pickedUp_triple = 1;
                endcase
            end
        end
    end

    // Timers
    logic [15:0] speed_timer, triple_timer, wallPhase_timer;
    logic wallPhase_latch;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            speedBoost_active <= 0;
            speed_timer <= 0;
            tripleShot_active <= 0;
            triple_timer <= 0;
            wallPhase_timer <= 0;
            wallPhase_latch <= 0;
        end else begin
            // Speed boost
            if (pickedUp_speed) begin
                speedBoost_active <= 1;
                speed_timer <= 16'd600;
            end else if (speed_timer > 0) begin
                speed_timer <= speed_timer - 1;
            end else begin
                speedBoost_active <= 0;
            end

            // Triple shot
            if (pickedUp_triple) begin
                tripleShot_active <= 1;
                triple_timer <= 16'd600;
            end else if (triple_timer > 0) begin
                triple_timer <= triple_timer - 1;
            end else begin
                tripleShot_active <= 0;
            end

            // Wall phase
            if (pickedUp_wallPhase) begin
                wallPhase_timer <= 16'd600;
                wallPhase_latch <= 1;
            end else if (wallPhase_timer > 0) begin
                wallPhase_timer <= wallPhase_timer - 1;
            end else if (!onWall) begin
                wallPhase_latch <= 0;
            end
        end
    end

    assign wallPhase_active = (wallPhase_timer > 0) || wallPhase_latch;

    // Despawn after pickup
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 3; i++) begin
                powerupVisible[i] <= 0;
                powerupX[i] <= 0;
                powerupY[i] <= 0;
                powerupType[i] <= 0;
            end
        end else begin
            // Despawn picked-up ones
            for (i = 0; i < 3; i++) begin
                if (pickedUp[i] && powerupVisible[i])
                    powerupVisible[i] <= 0;
            end

            // Spawn new
            if (enable_spawn) begin
                rand_tile_x = lfsr_x % MAZE_W;
                rand_tile_y = lfsr_y % MAZE_H;
                rand_type   = {lfsr_x[0], lfsr_y[0]} % 3;

                if (outmaze[rand_tile_y][rand_tile_x] == 1'b0) begin
                    for (i = 0; i < 3; i++) begin
                        if (!powerupVisible[i]) begin
                            powerupX[i]       <= rand_tile_x * TILE_WIDTH;
                            powerupY[i]       <= rand_tile_y * TILE_HEIGHT;
                            powerupType[i]    <= rand_type;
                            powerupVisible[i] <= 1;
                            break;
                        end
                    end
                end
            end
        end
    end
endmodule




