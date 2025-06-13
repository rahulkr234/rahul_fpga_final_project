module bullet_collision (
    input  logic [9:0] BulletX,
    input  logic [9:0] BulletY,
    input  logic [19:0] outmaze [0:19],
    output logic collisionX,
    output logic collisionY
);
    parameter TILE_WIDTH = 32;
    parameter TILE_HEIGHT = 24;

    logic [4:0] tile_x, tile_y;
    logic [4:0] next_tile_x, next_tile_y;

    always_comb begin
        tile_x = BulletX / TILE_WIDTH;
        tile_y = BulletY / TILE_HEIGHT;

        next_tile_x = (BulletX + 1) / TILE_WIDTH;
        next_tile_y = (BulletY + 1) / TILE_HEIGHT;

        collisionX = (outmaze[tile_y][next_tile_x] == 1'b1) || (outmaze[tile_y][tile_x] == 1'b1 && BulletX % TILE_WIDTH == 0);
        collisionY = (outmaze[next_tile_y][tile_x] == 1'b1) || (outmaze[tile_y][tile_x] == 1'b1 && BulletY % TILE_HEIGHT == 0);
    end
endmodule
