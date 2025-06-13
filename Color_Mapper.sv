//
// Handles all the visual VGA pixel mapping
// Renders the sprites by instantiating the ROM
// Color output given based on priority
//
module color_mapper (
    input  logic [9:0] BallX, BallY, DrawX, DrawY, Ball_size, ballmotionx, ballmotiony,
    input  logic [9:0] player2X, player2Y, player2motionx, player2motiony,
    input  logic [19:0] outmaze [0:19],

    input  logic [9:0] BulletX [0:2],
    input  logic [9:0] BulletY [0:2],
    input  logic       bullet_active [0:2],
    input  logic [9:0] Bullet2X [0:2],
    input  logic [9:0] Bullet2Y [0:2],
    input  logic       bullet2_active [0:2],

    input  logic [9:0] powerupX [0:2],
    input  logic [9:0] powerupY [0:2],
    input  logic [1:0] powerupType [0:2],
    input  logic       powerupVisible [0:2],

    output logic [3:0] Red, Green, Blue
);

// declare internal logic for sprites

logic wall_on;
logic [3:0] sprite_row, sprite_col, sprite_row2, sprite_col2;
logic [3:0] sprite_r, sprite_g, sprite_b;
logic [3:0] sprite2_r, sprite2_g, sprite2_b;

logic [9:0] rel_x = DrawX - BallX + 8;
logic [9:0] rel_y = DrawY - BallY + 8;

logic [9:0] rel2_x = DrawX - player2X + 8;
logic [9:0] rel2_y = DrawY - player2Y + 8;

// select coordinates for player 1 and 2
assign sprite_row = rel_y[3:0];
assign sprite_col = rel_x[3:0];
assign sprite_row2 = rel2_y[3:0];
assign sprite_col2 = rel2_x[3:0];

logic [4:0] tile_x = DrawX / 32;
logic [4:0] tile_y = DrawY / 24;
assign wall_on = (tile_y < 20 && tile_x < 20) ? outmaze[tile_y][tile_x] : 1'b0;

// Floor and wall textures
logic [3:0] floor_r, floor_g, floor_b;
logic [3:0] wall_r, wall_g, wall_b;
floor_tile_rom floor_tile (.row(DrawY[2:0]), .col(DrawX[2:0]), .R(floor_r), .G(floor_g), .B(floor_b));
wall_tile_rom wall_texture (.row(DrawY[3:0]), .col(DrawX[3:0]), .R(wall_r), .G(wall_g), .B(wall_b));

// Shared sprite ROMs
logic [3:0] left_r, left_g, left_b, right_r, right_g, right_b, up_r, up_g, up_b, down_r, down_g, down_b, middle_r, middle_g, middle_b;
logic [3:0] middle2_r, middle2_g, middle2_b;

// instantiate ROM
player_sprite_rom sprite_middle (.row(sprite_row), .col(sprite_col), .R(middle_r), .G(middle_g), .B(middle_b));
player_sprite_rom_left sprite_left (.row(sprite_row), .col(sprite_col), .R(left_r), .G(left_g), .B(left_b));
player_sprite_rom_right sprite_right (.row(sprite_row), .col(sprite_col), .R(right_r), .G(right_g), .B(right_b));
player_sprite_rom_up sprite_up (.row(sprite_row), .col(sprite_col), .R(up_r), .G(up_g), .B(up_b));
player_sprite_rom sprite_down (.row(sprite_row), .col(sprite_col), .R(down_r), .G(down_g), .B(down_b));
player_sprite_rom sprite_middle2 (.row(sprite_row2), .col(sprite_col2), .R(middle2_r), .G(middle2_g), .B(middle2_b));

logic [3:0] left2_r, left2_g, left2_b;
logic [3:0] right2_r, right2_g, right2_b;
logic [3:0] up2_r, up2_g, up2_b;
logic [3:0] down2_r, down2_g, down2_b;

player_sprite_rom_left sprite_left2 (
    .row(sprite_row2), .col(sprite_col2),
    .R(left2_r), .G(left2_g), .B(left2_b)
);

player_sprite_rom_right sprite_right2 (
    .row(sprite_row2), .col(sprite_col2),
    .R(right2_r), .G(right2_g), .B(right2_b)
);

player_sprite_rom_up sprite_up2 (
    .row(sprite_row2), .col(sprite_col2),
    .R(up2_r), .G(up2_g), .B(up2_b)
);

player_sprite_rom sprite_down2 (
    .row(sprite_row2), .col(sprite_col2),
    .R(down2_r), .G(down2_g), .B(down2_b)
);
// Bullet detection
parameter BULLET_SIZE = 4;
logic bullet_on, bullet2_on;
always_comb begin
    bullet_on = 0;
    bullet2_on = 0;
    for (int i = 0; i < 3; i++) begin
        if (bullet_active[i] && DrawX >= BulletX[i] && DrawX < BulletX[i] + BULLET_SIZE && DrawY >= BulletY[i] && DrawY < BulletY[i] + BULLET_SIZE)
            bullet_on = 1;
        if (bullet2_active[i] && DrawX >= Bullet2X[i] && DrawX < Bullet2X[i] + BULLET_SIZE && DrawY >= Bullet2Y[i] && DrawY < Bullet2Y[i] + BULLET_SIZE)
            bullet2_on = 1;
    end
end

// Power-up detection
logic powerup_on;
logic [3:0] powerup_r, powerup_g, powerup_b;
always_comb begin
    powerup_on = 0;
    for (int i = 0; i < 3; i++) begin
        if (powerupVisible[i] && DrawX >= powerupX[i] && DrawX < powerupX[i] + 8 && DrawY >= powerupY[i] && DrawY < powerupY[i] + 8) begin
            powerup_on = 1;
            case (powerupType[i])
                2'd0: begin powerup_r = 4'hF; powerup_g = 4'hF; powerup_b = 4'h0; end // Yellow
                2'd1: begin powerup_r = 4'hF; powerup_g = 4'h7; powerup_b = 4'h0; end // Orange
                2'd2: begin powerup_r = 4'h0; powerup_g = 4'hF; powerup_b = 4'hF; end // Cyan
                default: begin powerup_r = 4'hF; powerup_g = 4'hF; powerup_b = 4'hF; end
            endcase
        end
    end
end

// Directional sprite selection
always_comb begin
    if (ballmotionx == -10'd1) begin sprite_r = left_r; sprite_g = left_g; sprite_b = left_b; end
    else if (ballmotionx ==  10'd1) begin sprite_r = right_r; sprite_g = right_g; sprite_b = right_b; end
    else if (ballmotiony == -10'd1) begin sprite_r = up_r; sprite_g = up_g; sprite_b = up_b; end
    else if (ballmotiony ==  10'd1) begin sprite_r = down_r; sprite_g = down_g; sprite_b = down_b; end
    else begin sprite_r = middle_r; sprite_g = middle_g; sprite_b = middle_b; end

    if (player2motionx == -10'd1) begin sprite2_r = left2_r; sprite2_g = left2_g; sprite2_b = left2_b; end
    else if (player2motionx ==  10'd1) begin sprite2_r = right2_r; sprite2_g = right2_g; sprite2_b = right2_b; end
    else if (player2motiony == -10'd1) begin sprite2_r = up2_r; sprite2_g = up2_g; sprite2_b = up2_b; end
    else if (player2motiony ==  10'd1) begin sprite2_r = down2_r; sprite2_g = down2_g; sprite2_b = down2_b; end
    else begin sprite2_r = middle2_r; sprite2_g = middle2_g; sprite2_b = middle2_b; end
end

// Final color output priority
always_comb begin
    if (bullet_on) begin
        Red = 4'hF; Green = 4'hE; Blue = 4'hE;
    end else if (bullet2_on) begin
        Red = 4'hB; Green = 4'hF; Blue = 4'hB;
    end else if (powerup_on) begin
        Red = powerup_r; Green = powerup_g; Blue = powerup_b;
    end else if (rel_x < 16 && rel_y < 16 && {sprite_r, sprite_g, sprite_b} != 12'hFFF) begin
        Red = sprite_r; Green = sprite_g; Blue = sprite_b;
    end else if (rel2_x < 16 && rel2_y < 16 && {sprite2_r, sprite2_g, sprite2_b} != 12'hFFF) begin
        Red = sprite2_r; Green = sprite2_g; Blue = sprite2_b;
    end else if (wall_on) begin
        Red = wall_r; Green = wall_g; Blue = wall_b;
    end else begin
        Red = floor_r; Green = floor_g; Blue = floor_b;
    end
end
endmodule
