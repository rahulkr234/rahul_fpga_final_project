//
//  Rahul Kumar Final Project for ECE 385
//
//  Arena Style 1v1 Multiplayer Shooter Game
//  "Battle in the Dungeon"
//  5/9/2025
//


// This is the top level module extracted from lab 6.2

module mb_usb_hdmi_top(
    input logic Clk,
    input logic reset_rtl_0,
    
    //USB signals
    input logic [0:0] gpio_usb_int_tri_i,
    output logic gpio_usb_rst_tri_o,
    input logic usb_spi_miso,
    output logic usb_spi_mosi,
    output logic usb_spi_sclk,
    output logic usb_spi_ss,
    
    //UART
    input logic uart_rtl_0_rxd,
    output logic uart_rtl_0_txd,
    
    //HDMI
    output logic hdmi_tmds_clk_n,
    output logic hdmi_tmds_clk_p,
    output logic [2:0]hdmi_tmds_data_n,
    output logic [2:0]hdmi_tmds_data_p,
        
    //HEX displays
    output logic [7:0] hex_segA,
    output logic [3:0] hex_gridA,
    output logic [7:0] hex_segB,
    output logic [3:0] hex_gridB
);
    
    logic [31:0] keycode0_gpio, keycode1_gpio;
    logic clk_25MHz, clk_125MHz, clk, clk_100MHz;
    logic locked;

    // used to track player 1
    logic [9:0] drawX, drawY, ballxsig, ballysig, ballsizesig;
    
    // for scoring
    logic [3:0] score_p1, score_p2;
    logic hit_p1, hit_p2;
    logic prev_hit_p1, prev_hit_p2;

    logic hsync, vsync, vde;
    logic [3:0] red, green, blue;
    logic reset_ah;
    
    assign reset_ah = reset_rtl_0;
    
    // score hex drivers
hex_driver HexA (
    .clk(Clk),
    .reset(reset_ah),
    .in({4'd0, 4'd0, 4'd0, score_p1}),
    .hex_seg(hex_segA),
    .hex_grid(hex_gridA)
);

hex_driver HexB (
    .clk(Clk),
    .reset(reset_ah),
    .in({4'd0, 4'd0, 4'd0, score_p2}),
    .hex_seg(hex_segB),
    .hex_grid(hex_gridB)
);
    
    mb_block mb_block (
        .clk_100MHz(Clk),
        .gpio_usb_int_tri_i(gpio_usb_int_tri_i),
        .gpio_usb_keycode_0_tri_o(keycode0_gpio),
        .gpio_usb_keycode_1_tri_o(keycode1_gpio),
        .gpio_usb_rst_tri_o(gpio_usb_rst_tri_o),
        .reset_rtl_0(~reset_ah), //Block designs expect active low reset, all other modules are active high
        .uart_rtl_0_rxd(uart_rtl_0_rxd),
        .uart_rtl_0_txd(uart_rtl_0_txd),
        .usb_spi_miso(usb_spi_miso),
        .usb_spi_mosi(usb_spi_mosi),
        .usb_spi_sclk(usb_spi_sclk),
        .usb_spi_ss(usb_spi_ss)
    );
        
    //clock wizard configured with a 1x and 5x clock for HDMI
    clk_wiz_0 clk_wiz (
        .clk_out1(clk_25MHz),
        .clk_out2(clk_125MHz),
        .reset(reset_ah),
        .locked(locked),
        .clk_in1(Clk)
    );
    
    //VGA Sync signal generator
    vga_controller vga (
        .pixel_clk(clk_25MHz),
        .reset(reset_ah),
        .hs(hsync),
        .vs(vsync),
        .active_nblank(vde),
        .drawX(drawX),
        .drawY(drawY)
    );    

    //Real Digital VGA to HDMI converter
    hdmi_tx_0 vga_to_hdmi (
        //Clocking and Reset
        .pix_clk(clk_25MHz),
        .pix_clkx5(clk_125MHz),
        .pix_clk_locked(locked),
        //Reset is active LOW
        .rst(reset_ah),
        //Color and Sync Signals
        .red(red),
        .green(green),
        .blue(blue),
        .hsync(hsync),
        .vsync(vsync),
        .vde(vde),
        
        //aux Data (unused)
        .aux0_din(4'b0),
        .aux1_din(4'b0),
        .aux2_din(4'b0),
        .ade(1'b0),
        
        //Differential outputs
        .TMDS_CLK_P(hdmi_tmds_clk_p),          
        .TMDS_CLK_N(hdmi_tmds_clk_n),          
        .TMDS_DATA_P(hdmi_tmds_data_p),         
        .TMDS_DATA_N(hdmi_tmds_data_n)          
    );

    // use to detect collision for player 1
    logic collision;
    logic internal_reset;
    
    // contains the maze bitmap
    logic [19:0] passmaze [0:19];
    
    // phase thru wall power up
    logic wallPhase_active;    

// logic for maze collisions
    maze_logic maze_logic_inst (
        .wallPhase_active(wallPhase_active), // NEW
        .BallX(ballxsig),
        .BallY(ballysig),
        .BallS(ballsizesig),
        .maze(passmaze),
        .collision(collision)
    );
    
 // Player 2 Control Signals
logic [9:0] player2X, player2Y, player2S;
logic [9:0] motionx2, motiony2;
logic onWall2;
logic collision2;
   
// logic for maze collisions, player 2
maze_logic maze_logic_p2 (
    .wallPhase_active(wallPhase_active),
    .BallX(player2X),
    .BallY(player2Y),
    .BallS(player2S),
    .maze(passmaze),
    .collision(collision2)
);

    
logic [9:0] motionx;
logic [9:0] motiony;

// Bullet position and control
logic [9:0] bulletX [0:2];
logic [9:0] bulletY [0:2];
logic bullet_active [0:2];
logic collisionX [0:2];
logic collisionY [0:2];
logic [2:0] shoot_en;

logic tripleShot_active; // triple shot powerup
logic onWall;

//separate
logic shoot_signal;
logic [7:0] prev_keycode;

logic [1:0] active_count;
logic [1:0] max_bullets;

assign max_bullets = tripleShot_active ? 2'd3 : 2'd1;
assign active_count = bullet_active[0] + bullet_active[1] + bullet_active[2];

// Shoot signal detection (same as before)
// logic [7:0] prev_keycode;
always_ff @(posedge vsync) begin
    prev_keycode <= keycode0_gpio[7:0];

    if ((keycode0_gpio[7:0] == 8'h52 ||  // up
         keycode0_gpio[7:0] == 8'h51 ||  // down
         keycode0_gpio[7:0] == 8'h50 ||  // left
         keycode0_gpio[7:0] == 8'h4F) && // right
        (keycode0_gpio[7:0] != prev_keycode) &&
        !onWall) begin                   // <-- NEW CONDITION
            shoot_signal <= 1;
        end else begin
            shoot_signal <= 0;
    end
end

// Drive one shoot_en high based on availability
always_comb begin
    shoot_en = 3'b000;
    if (shoot_signal && active_count < max_bullets) begin
        if (!bullet_active[0])
            shoot_en[0] = 1;
        else if (!bullet_active[1])
            shoot_en[1] = 1;
        else if (!bullet_active[2])
            shoot_en[2] = 1;
    end
end

// generate bullets
genvar i;
generate
    for (i = 0; i < 3; i++) begin : bullets
        bullet bullet_inst (
            .Reset(reset_ah),
            .frame_clk(vsync),
            .shoot(shoot_en[i]),
            .keycode(keycode0_gpio[7:0]),
            .playerX(ballxsig),
            .playerY(ballysig),
            .collisionX(collisionX[i]),
            .collisionY(collisionY[i]),
            .BulletX(bulletX[i]),
            .BulletY(bulletY[i]),
            .bullet_active(bullet_active[i])
        );
    end
endgenerate

generate
    for (i = 0; i < 3; i++) begin : bullet_collisions
        bullet_collision bc_inst (
            .BulletX(bulletX[i]),
            .BulletY(bulletY[i]),
            .outmaze(passmaze),
            .collisionX(collisionX[i]),
            .collisionY(collisionY[i])
        );
    end
endgenerate

// internal logic for powerups
logic [9:0] powerupX [0:2];
logic [9:0] powerupY [0:2];
logic [1:0] powerupType [0:2];
logic       powerupVisible [0:2];

logic       enable_spawn;
logic [15:0] spawn_counter;
logic [1:0] num_powerups;

logic speedBoost_active;
logic pickedUp [0:2];

// spawning powerups
    assign num_powerups = powerupVisible[0] + powerupVisible[1] + powerupVisible[2];
    always_ff @(posedge vsync or posedge reset_ah) begin
        if (reset_ah) begin
            spawn_counter <= 0;
            enable_spawn <= 0;
        end else begin
            if (spawn_counter >= 16'd300 && num_powerups < 3) begin  // 5 seconds
                enable_spawn <= 1;
                spawn_counter <= 0;
            end else begin
                enable_spawn <= 0;
                spawn_counter <= spawn_counter + 1;
            end
        end
    end

// Bullet 2 control signals
logic [9:0] bullet2X [0:2];
logic [9:0] bullet2Y [0:2];
logic bullet2_active [0:2];
logic collision2X [0:2];
logic collision2Y [0:2];
logic [2:0] shoot_en2;
logic shoot_signal2;
logic [7:0] prev_keycode2;
logic [1:0] active_count2;
logic [1:0] max_bullets2;

// Color mapper to display VGA output
color_mapper color_instance (
    .BallX(ballxsig),
    .BallY(ballysig),
    .DrawX(drawX),
    .DrawY(drawY),
    .Ball_size(ballsizesig),
    .ballmotionx(motionx),
    .ballmotiony(motiony),
    .player2X(player2X),
    .player2Y(player2Y),
    .player2motionx(motionx2),
    .player2motiony(motiony2),
    .Bullet2X(bullet2X),
    .Bullet2Y(bullet2Y),
    .bullet2_active(bullet2_active),
    .outmaze(passmaze),
    .BulletX(bulletX),
    .BulletY(bulletY),
    .bullet_active(bullet_active),
    .powerupX(powerupX),
    .powerupY(powerupY),
    .powerupType(powerupType),
    .powerupVisible(powerupVisible),
    .Red(red),
    .Green(green),
    .Blue(blue)
);

// render the maze
    maze_renderer maze_inst (
        .DrawX(),
        .DrawY(),
        .Red(),
        .Green(),
        .Blue(),
        .outmaze(passmaze)
    );

// player 1 instance
    ball ball_instance (
        .Reset(internal_reset),
        .frame_clk(vsync),
        .keycode(keycode0_gpio[7:0]),
        .collision(collision),
        .speedBoost_active(speedBoost_active),
        .wallPhase_active(wallPhase_active),
        .outmaze(passmaze),
        .BallX(ballxsig),
        .BallY(ballysig),
        .BallS(ballsizesig),
        .ballmotionx(motionx),
        .ballmotiony(motiony),
        .onWall(onWall)
    );
    
    // Pickup detection logic
    always_comb begin
        for (int i = 0; i < 3; i++) begin
            // Assume powerups are 8x8 pixels, player is BallS x BallS
            // Check axis-aligned bounding box (AABB) overlap
            if (powerupVisible[i] &&
                ballxsig + ballsizesig > powerupX[i] &&
                ballxsig < powerupX[i] + 8 &&
                ballysig + ballsizesig > powerupY[i] &&
                ballysig < powerupY[i] + 8) begin
                pickedUp[i] = 1;
            end else begin
                pickedUp[i] = 0;
            end
        end
    end

// powerup manager
    powerup_manager powerup_mgr_inst (
    .clk(vsync),
    .reset(internal_reset),
    .enable_spawn(enable_spawn),
    .outmaze(passmaze),
    .pickedUp(pickedUp),
    .onWall(onWall), 
    .powerupX(powerupX),
    .powerupY(powerupY),
    .powerupType(powerupType),
    .powerupVisible(powerupVisible),
    .speedBoost_active(speedBoost_active),
    .tripleShot_active(tripleShot_active),
    .wallPhase_active(wallPhase_active)
);


assign max_bullets2 = tripleShot_active ? 2'd3 : 2'd1;
assign active_count2 = bullet2_active[0] + bullet2_active[1] + bullet2_active[2];

// player2 instance
player2_ball p2 (
    .Reset(internal_reset),
    .frame_clk(vsync),
    .keycode(keycode0_gpio[7:0]),
    .collision(collision2),
    .speedBoost_active(speedBoost_active),
    .wallPhase_active(wallPhase_active),
    .outmaze(passmaze),
    .P2X(player2X),
    .P2Y(player2Y),
    .P2S(player2S),
    .motionX(motionx2),
    .motionY(motiony2),
    .onWall(onWall2)
);

// Shoot signal detection for player 2 
always_ff @(posedge vsync) begin
    prev_keycode2 <= keycode0_gpio[7:0];
    if ((keycode0_gpio[7:0] == 8'h0C || // I
         keycode0_gpio[7:0] == 8'h0D || // J
         keycode0_gpio[7:0] == 8'h0E || // K
         keycode0_gpio[7:0] == 8'h0F) && // L
         (keycode0_gpio[7:0] != prev_keycode2) &&
         !onWall2) begin
        shoot_signal2 <= 1;
    end else begin
        shoot_signal2 <= 0;
    end
end

always_comb begin
    shoot_en2 = 3'b000;
    if (shoot_signal2 && active_count2 < max_bullets2) begin
        if (!bullet2_active[0]) shoot_en2[0] = 1;
        else if (!bullet2_active[1]) shoot_en2[1] = 1;
        else if (!bullet2_active[2]) shoot_en2[2] = 1;
    end
end

// Instantiate bullets for player 2
generate
    for (i = 0; i < 3; i++) begin : bullets2
        bullet bullet2_inst (
            .Reset(internal_reset),
            .frame_clk(vsync),
            .shoot(shoot_en2[i]),
            .keycode(keycode0_gpio[7:0]),
            .playerX(player2X),
            .playerY(player2Y),
            .collisionX(collision2X[i]),
            .collisionY(collision2Y[i]),
            .BulletX(bullet2X[i]),
            .BulletY(bullet2Y[i]),
            .bullet_active(bullet2_active[i])
        );
    end
endgenerate

// Bullet collision for player 2
generate
    for (i = 0; i < 3; i++) begin : bullet2_collisions
        bullet_collision bc2_inst (
            .BulletX(bullet2X[i]),
            .BulletY(bullet2Y[i]),
            .outmaze(passmaze),
            .collisionX(collision2X[i]),
            .collisionY(collision2Y[i])
        );
    end
endgenerate

logic reset_game;


// pvp collision manager
collision_pvp pvp (
    .bulletX1(bulletX[0]),     // or loop for all
    .bulletY1(bulletY[0]),
    .bullet1_active(bullet_active[0]),
    .bulletX2(bullet2X[0]),
    .bulletY2(bullet2Y[0]),
    .bullet2_active(bullet2_active[0]),
    .player1X(ballxsig),
    .player1Y(ballysig),
    .player2X(player2X),
    .player2Y(player2Y),
    .reset_game(reset_game),
    .hit_p1(hit_p1),
    .hit_p2(hit_p2)
);

assign internal_reset = reset_ah || reset_game;

        // scoring logic
        always_ff @(posedge vsync or posedge reset_ah) begin
    if (reset_ah) begin
        score_p1 <= 0;
        score_p2 <= 0;
        prev_hit_p1 <= 0;
        prev_hit_p2 <= 0;
    end else begin
        prev_hit_p1 <= hit_p1;
        prev_hit_p2 <= hit_p2;

        // Score only on rising edge
        if (hit_p2 && !prev_hit_p2 && score_p1 < 9)
            score_p1 <= score_p1 + 1;
        if (hit_p1 && !prev_hit_p1 && score_p2 < 9)
            score_p2 <= score_p2 + 1;
    end
end

endmodule
