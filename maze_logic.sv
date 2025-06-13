// collision handler for player 
module maze_logic (
    input  logic        wallPhase_active,         
    input  logic [9:0]  BallX,
    input  logic [9:0]  BallY,
    input  logic [9:0]  BallS,
    input  logic [19:0] maze [0:19],
    output logic        collision
);
    parameter TILE_WIDTH  = 32;
    parameter TILE_HEIGHT = 24;

    logic [4:0] check_x, check_y;

    assign check_x = BallX / TILE_WIDTH;
    assign check_y = BallY / TILE_HEIGHT;

// if wallphase powerup is active then collisions are off
    always_comb begin
        if (wallPhase_active)
            collision = 0;
        else
            collision = maze[check_y][check_x];
    end
endmodule

