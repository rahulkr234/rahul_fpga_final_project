// just provides the map for the maze and passes it out through outmaze
module maze_renderer (
    input logic [9:0] DrawX,
    input logic [9:0] DrawY,
    output logic [3:0] Red,
    output logic [3:0] Green,
    output logic [3:0] Blue,
    output logic [19:0] outmaze [0:19]
);
    parameter TILE_WIDTH = 32;
    parameter TILE_HEIGHT = 24;
    parameter MAZE_WIDTH = 20;
    parameter MAZE_HEIGHT = 20;

    logic [MAZE_HEIGHT-1:0][MAZE_WIDTH-1:0] maze = '{
        20'b11111111111111111111, // Top wall
        20'b10000000000000000001, // Vertical hallway start
        20'b10001110011110100001, // Room 1 top wall (4x4)
        20'b10000010000010100001, // Room 1 interior
        20'b10000010000010100001, // Room 1 interior
        20'b10111110011110100001, // Room 1 bottom wall
        20'b10000000000000100001, // Horizontal hallway
        20'b11111110111110111001, // Room 2 & 3 top wall (2x2 + 3x3)
        20'b10000010100000000001, // Room 2 interior, door to Room 3
        20'b10000010101110000001, // Room 3 right wall
        20'b10000010100010000001, // Room 3 interior
        20'b10000010111010000001, // Room 3 bottom wall
        20'b10000000100010000001, // Vertical corridor
        20'b10000000101111111001, // Room 4 top (3x3)
        20'b10000000101000001001, // Room 4 interior
        20'b10000000101000001001, // Room 4 interior
        20'b10001111101000001001, // Room 4 bottom
        20'b10000000000000000001, // Bottom hallway
        20'b10000000000000000001, // Bottom hallway
        20'b11111111111111111111  // Bottom wall
    };

    logic [4:0] cell_x, cell_y;
    logic wall;

    assign cell_x = DrawX / TILE_WIDTH;
    assign cell_y = DrawY / TILE_HEIGHT;

    assign wall = maze[cell_y][cell_x];

    always_comb begin
        if (wall) begin
            Red = 4'hF;
            Green = 4'h0;
            Blue = 4'h0;
        end else begin
            Red = 4'h0;
            Green = 4'h0;
            Blue = 4'h0;
        end
    end
    
    always_comb begin
        for (int i = 0; i < 20; i++) begin
            for (int j = 0; j < 20; j++) begin
                outmaze[i][j] = maze[i][j]; // Copy each element from maze to outmaze
            end
        end
    end
endmodule
