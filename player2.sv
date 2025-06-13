// player2_ball.sv 
// very similar to ball sv, just player2 signals instead
module player2_ball (
    input  logic        Reset,
    input  logic        frame_clk,
    input  logic [7:0]  keycode,
    input  logic        collision,
    input  logic        speedBoost_active,
    input  logic        wallPhase_active,
    input  logic [19:0] outmaze [0:19],

    output logic [9:0]  P2X,
    output logic [9:0]  P2Y,
    output logic [9:0]  P2S,
    output logic [9:0]  motionX,
    output logic [9:0]  motionY,
    output logic        onWall
);

    parameter [9:0] P2_X_Center = 560;
    parameter [9:0] P2_Y_Center = 416;

    logic [9:0] X_Motion, Y_Motion;
    logic [9:0] X_Motion_next, Y_Motion_next;
    logic [9:0] X_next, Y_next;

    logic [9:0] step;
    assign step = speedBoost_active ? 10'd2 : 10'd1;

    assign P2S = 16;

    assign X_next = P2X + X_Motion_next;
    assign Y_next = P2Y + Y_Motion_next;

    always_comb begin
        Y_Motion_next = Y_Motion;
        X_Motion_next = X_Motion;

        if (keycode == 8'h17) begin // T = up
            Y_Motion_next = -step;
            X_Motion_next = 10'd0;
        end else if (keycode == 8'h09) begin // F = left
            Y_Motion_next = 10'd0;
            X_Motion_next = -step;
        end else if (keycode == 8'h0B) begin // G = right
            Y_Motion_next = 10'd0;
            X_Motion_next = step;
        end else if (keycode == 8'h0A) begin // H = down
            Y_Motion_next = step;
            X_Motion_next = 10'd0;
        end else if (keycode == 8'h00) begin
            Y_Motion_next = 10'd0;
            X_Motion_next = 10'd0;
        end

        if (collision) begin
            if (X_Motion != 10'd0)
                X_Motion_next = -X_Motion;
            if (Y_Motion != 10'd0)
                Y_Motion_next = -Y_Motion;
        end
    end

    logic [4:0] tileX_local;
    logic [4:0] tileY_local;

    always_ff @(posedge frame_clk) begin
        if (Reset) begin
            Y_Motion <= 10'd0;
            X_Motion <= 10'd1;
            P2Y <= P2_Y_Center;
            P2X <= P2_X_Center;
        end else begin
            Y_Motion <= Y_Motion_next;
            X_Motion <= X_Motion_next;

            tileX_local = X_next / 32;
            tileY_local = Y_next / 24;

            if (wallPhase_active || outmaze[tileY_local][tileX_local] == 1'b0) begin
                P2X <= X_next;
                P2Y <= Y_next;
            end
        end
    end

    assign onWall = outmaze[P2Y / 24][P2X / 32];
    assign motionX = X_Motion;
    assign motionY = Y_Motion;

endmodule