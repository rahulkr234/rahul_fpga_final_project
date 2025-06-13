// this module is used to track and move the player (player1). it was built upon from lab 6.2
module ball 
( 
    input  logic        Reset, 
    input  logic        frame_clk,
    input  logic [7:0]  keycode,
    input  logic        collision,
    input  logic        speedBoost_active, //takes in powerup control signals
    input  logic        wallPhase_active,
    input  logic [19:0] outmaze [0:19],

    output logic [9:0]  BallX, 
    output logic [9:0]  BallY, 
    output logic [9:0]  BallS,
    output logic [9:0]  ballmotionx,
    output logic [9:0]  ballmotiony,
    output logic        onWall
);

    parameter [9:0] Ball_X_Center = 320;
    parameter [9:0] Ball_Y_Center = 240;

    logic [9:0] Ball_X_Motion, Ball_Y_Motion;
    logic [9:0] Ball_X_Motion_next, Ball_Y_Motion_next;
    logic [9:0] Ball_X_next, Ball_Y_next;

// speed boost if active
    logic [9:0] step;
    assign step = speedBoost_active ? 10'd2 : 10'd1;

    assign BallS = 16;

    assign Ball_X_next = BallX + Ball_X_Motion_next;
    assign Ball_Y_next = BallY + Ball_Y_Motion_next;

    always_comb begin
        Ball_Y_Motion_next = Ball_Y_Motion;
        Ball_X_Motion_next = Ball_X_Motion;

        if (keycode == 8'h1A) begin // W
            Ball_Y_Motion_next = -step;
            Ball_X_Motion_next = 10'd0;
        end else if (keycode == 8'h4) begin // A
            Ball_Y_Motion_next = 10'd0;
            Ball_X_Motion_next = -step;
        end else if (keycode == 8'h16) begin // S
            Ball_Y_Motion_next = step;
            Ball_X_Motion_next = 10'd0;
        end else if (keycode == 8'h7) begin // D
            Ball_Y_Motion_next = 10'd0;
            Ball_X_Motion_next = step;
        end else if (keycode == 8'h00) begin
            Ball_Y_Motion_next = 10'd0;
            Ball_X_Motion_next = 10'd0;
        end

        if (collision) begin
            if (Ball_X_Motion != 10'd0)
                Ball_X_Motion_next = -Ball_X_Motion;
            if (Ball_Y_Motion != 10'd0)
                Ball_Y_Motion_next = -Ball_Y_Motion;
        end
    end

logic [4:0] tileX_local;
logic [4:0] tileY_local;

// movement calculations
    // tile check
    always_ff @(posedge frame_clk) begin
        if (Reset) begin
            Ball_Y_Motion <= 10'd0;
            Ball_X_Motion <= 10'd1;
            BallY <= 10'd48;  // row 2
            BallX <= 10'd64;  // col 2
        end else begin
            Ball_Y_Motion <= Ball_Y_Motion_next;
            Ball_X_Motion <= Ball_X_Motion_next;

            tileX_local = Ball_X_next / 32;
            tileY_local = Ball_Y_next / 24;

            if (wallPhase_active || outmaze[tileY_local][tileX_local] == 1'b0) begin
                BallX <= Ball_X_next;
                BallY <= Ball_Y_next;
            end
        end
    end

    assign onWall = outmaze[BallY / 24][BallX / 32];
    assign ballmotionx = Ball_X_Motion;
    assign ballmotiony = Ball_Y_Motion;

endmodule




