// This module contains logic for tracking the bullet as a projectile and moving it
module bullet (
    input  logic        Reset,
    input  logic        frame_clk,
    input  logic        shoot,
    input  logic [7:0]  keycode,
    input  logic [9:0]  playerX,
    input  logic [9:0]  playerY,
    input  logic        collisionX,
    input  logic        collisionY,

    output logic [9:0]  BulletX,
    output logic [9:0]  BulletY,
    output logic        bullet_active
);

    parameter [9:0] Bullet_X_Step = 2;
    parameter [9:0] Bullet_Y_Step = 2;
    parameter [9:0] X_MAX = 639;
    parameter [9:0] Y_MAX = 479;

// i had to add a bounce cooldown to help with ping ponging collisions. sometimes the ball would get stuck after hitting a wall
// to work around this, i implemented a cooldown to wait after a first bounce so that the ball could leave the wall

    parameter [7:0] MAX_LIFETIME = 120;      // 2 second at 60 fps
    parameter [2:0] BOUNCE_COOLDOWN = 10;    // frames to wait after a bounce

    logic [9:0] BulletDX, BulletDY;
    logic [7:0] lifetime;
    logic [2:0] bounce_cooldown_counter;

    always_ff @(posedge frame_clk or posedge Reset) begin
        if (Reset) begin
            BulletX <= 0;
            BulletY <= 0;
            BulletDX <= 0;
            BulletDY <= 0;
            bullet_active <= 0;
            lifetime <= 0;
            bounce_cooldown_counter <= 0;

        end else if (shoot && !bullet_active) begin
            BulletX <= playerX;
            BulletY <= playerY;
            bullet_active <= 1;
            lifetime <= 0;
            bounce_cooldown_counter <= 0;


// direction based on keycode input
        case (keycode)
            // Arrow keys 
            8'h52, 8'h0C: begin BulletDX <= 0;              BulletDY <= -Bullet_Y_Step; end // Up 
            8'h51, 8'h0E: begin BulletDX <= 0;              BulletDY <=  Bullet_Y_Step; end // Down 
            8'h50, 8'h0D: begin BulletDX <= -Bullet_X_Step; BulletDY <= 0;              end // Left 
            8'h4F, 8'h0F: begin BulletDX <=  Bullet_X_Step; BulletDY <= 0;              end // Right
            default:      begin BulletDX <= 0;              BulletDY <= 0;              end
        endcase

        end else if (bullet_active) begin
            if (BulletX >= X_MAX || BulletY >= Y_MAX || lifetime >= MAX_LIFETIME) begin
                bullet_active <= 0;

// cooldown logic
            end else begin
                if (bounce_cooldown_counter == 0) begin
                    if (collisionX) begin
                        BulletDX <= -BulletDX;
                        bounce_cooldown_counter <= BOUNCE_COOLDOWN;
                    end
                    if (collisionY) begin
                        BulletDY <= -BulletDY;
                        bounce_cooldown_counter <= BOUNCE_COOLDOWN;
                    end
                end else begin
                    bounce_cooldown_counter <= bounce_cooldown_counter - 1;
                end

                BulletX <= BulletX + BulletDX;
                BulletY <= BulletY + BulletDY;
                lifetime <= lifetime + 1;
            end
        end
    end
endmodule



