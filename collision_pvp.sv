// collision_pvp.sv - Resets game when one player is hit by the other player's bullet
module collision_pvp (
    input  logic [9:0] bulletX1, bulletY1,
    input  logic [9:0] bulletX2, bulletY2,
    input  logic       bullet1_active,
    input  logic       bullet2_active,
    input  logic [9:0] player1X, player1Y,
    input  logic [9:0] player2X, player2Y,
    output logic       reset_game,
    output logic       hit_p1,
    output logic       hit_p2
);
    parameter [9:0] PLAYER_SIZE = 16;

    assign hit_p1 = bullet2_active &&
                    (bulletX2 >= player1X && bulletX2 < player1X + PLAYER_SIZE) &&
                    (bulletY2 >= player1Y && bulletY2 < player1Y + PLAYER_SIZE);

    assign hit_p2 = bullet1_active &&
                    (bulletX1 >= player2X && bulletX1 < player2X + PLAYER_SIZE) &&
                    (bulletY1 >= player2Y && bulletY1 < player2Y + PLAYER_SIZE);

    assign reset_game = hit_p1 || hit_p2;
endmodule
