module player_sprite_rom (
    input  logic [3:0] row,
    input  logic [3:0] col,
    output logic [3:0] R, G, B
);
    logic [11:0] pixel;

    always_comb begin
        case (row)
            4'd0: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'hFFF;
                4'd5: pixel = 12'hFFF;
                4'd6: pixel = 12'hFFF;
                4'd7: pixel = 12'hFFF;
                4'd8: pixel = 12'hFFF;
                4'd9: pixel = 12'hFFF;
                4'd10: pixel = 12'hFFF;
                4'd11: pixel = 12'hFFF;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'h000;
            endcase
            4'd1: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'hFFF;
                4'd5: pixel = 12'hFFF;
                4'd6: pixel = 12'hFFF;
                4'd7: pixel = 12'h000;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'h000;
                4'd10: pixel = 12'hFFF;
                4'd11: pixel = 12'hFFF;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'h000;
            endcase
            4'd2: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'hFFF;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'h000;
                4'd7: pixel = 12'h337;
                4'd8: pixel = 12'h337;
                4'd9: pixel = 12'h337;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'h000;
            endcase
            4'd3: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h337;
                4'd6: pixel = 12'h337;
                4'd7: pixel = 12'h337;
                4'd8: pixel = 12'h337;
                4'd9: pixel = 12'h337;
                4'd10: pixel = 12'h337;
                4'd11: pixel = 12'h337;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'h000;
            endcase
            4'd4: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h337;
                4'd6: pixel = 12'h337;
                4'd7: pixel = 12'h337;
                4'd8: pixel = 12'h337;
                4'd9: pixel = 12'h337;
                4'd10: pixel = 12'h337;
                4'd11: pixel = 12'h337;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'h000;
            endcase
            4'd5: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h337;
                4'd6: pixel = 12'h337;
                4'd7: pixel = 12'h337;
                4'd8: pixel = 12'h337;
                4'd9: pixel = 12'h337;
                4'd10: pixel = 12'h337;
                4'd11: pixel = 12'h337;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'h000;
            endcase
            4'd6: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h337;
                4'd6: pixel = 12'hFEA;
                4'd7: pixel = 12'hFEA;
                4'd8: pixel = 12'h337;
                4'd9: pixel = 12'hFEA;
                4'd10: pixel = 12'hFEA;
                4'd11: pixel = 12'h337;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'h000;
            endcase
            4'd7: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'hFEA;
                4'd5: pixel = 12'hFEA;
                4'd6: pixel = 12'h000;
                4'd7: pixel = 12'hFEA;
                4'd8: pixel = 12'hFEA;
                4'd9: pixel = 12'hFEA;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'hFEA;
                4'd12: pixel = 12'hFEA;
                4'd13: pixel = 12'h000;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'h000;
            endcase
            4'd8: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'hFEA;
                4'd6: pixel = 12'h000;
                4'd7: pixel = 12'hFEA;
                4'd8: pixel = 12'hFEA;
                4'd9: pixel = 12'hFEA;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'hFEA;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'h000;
            endcase
            4'd9: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'hFEA;
                4'd7: pixel = 12'hFEA;
                4'd8: pixel = 12'hFEA;
                4'd9: pixel = 12'hFEA;
                4'd10: pixel = 12'hFEA;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'h000;
            endcase
            4'd10: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'hF30;
                4'd5: pixel = 12'hF30;
                4'd6: pixel = 12'h000;
                4'd7: pixel = 12'h000;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'h000;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'hF30;
                4'd12: pixel = 12'hF30;
                4'd13: pixel = 12'h000;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'h000;
            endcase
            4'd11: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'h444;
                4'd2: pixel = 12'h000;
                4'd3: pixel = 12'hFEA;
                4'd4: pixel = 12'hF30;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'hF30;
                4'd7: pixel = 12'hF30;
                4'd8: pixel = 12'hF30;
                4'd9: pixel = 12'hF30;
                4'd10: pixel = 12'hF30;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'h000;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'h000;
            endcase
            4'd12: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'h444;
                4'd2: pixel = 12'h000;
                4'd3: pixel = 12'hFEA;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'h000;
                4'd7: pixel = 12'h000;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'h000;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'hFEA;
                4'd12: pixel = 12'hFEA;
                4'd13: pixel = 12'h000;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'h000;
            endcase
            4'd13: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'h444;
                4'd2: pixel = 12'h000;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'hFFF;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'hF30;
                4'd7: pixel = 12'hF30;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'hF30;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'h000;
            endcase
            4'd14: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'hFFF;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'hF30;
                4'd7: pixel = 12'hF30;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'hFEA;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'hFFF;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'h000;
            endcase
            4'd15: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'hFFF;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'hFEA;
                4'd7: pixel = 12'hFEA;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'h000;
                4'd10: pixel = 12'hFFF;
                4'd11: pixel = 12'hFFF;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'h000;
            endcase
            default: pixel = 12'h000;
        endcase
        {R, G, B} = pixel;
    end
endmodule

module player_sprite_rom_left(
    input  logic [3:0] row,
    input  logic [3:0] col,
    output logic [3:0] R, G, B
);
    logic [11:0] pixel;

    always_comb begin
        case (row)
            4'd0: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'hFFF;
                4'd5: pixel = 12'hFFF;
                4'd6: pixel = 12'hFFF;
                4'd7: pixel = 12'hFFF;
                4'd8: pixel = 12'hFFF;
                4'd9: pixel = 12'hFFF;
                4'd10: pixel = 12'hFFF;
                4'd11: pixel = 12'hFFF;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd1: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'hFFF;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'h000;
                4'd7: pixel = 12'h000;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'h000;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'hFFF;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd2: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'h337;
                4'd7: pixel = 12'h337;
                4'd8: pixel = 12'h337;
                4'd9: pixel = 12'h337;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd3: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h337;
                4'd6: pixel = 12'h337;
                4'd7: pixel = 12'h337;
                4'd8: pixel = 12'h337;
                4'd9: pixel = 12'h337;
                4'd10: pixel = 12'h337;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd4: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'h337;
                4'd5: pixel = 12'h337;
                4'd6: pixel = 12'h337;
                4'd7: pixel = 12'h337;
                4'd8: pixel = 12'h337;
                4'd9: pixel = 12'h337;
                4'd10: pixel = 12'h337;
                4'd11: pixel = 12'h337;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd5: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'h337;
                4'd7: pixel = 12'h337;
                4'd8: pixel = 12'h337;
                4'd9: pixel = 12'h337;
                4'd10: pixel = 12'h337;
                4'd11: pixel = 12'h337;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd6: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h337;
                4'd6: pixel = 12'hFEA;
                4'd7: pixel = 12'hFEA;
                4'd8: pixel = 12'h337;
                4'd9: pixel = 12'h337;
                4'd10: pixel = 12'h337;
                4'd11: pixel = 12'h337;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd7: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'hFEA;
                4'd6: pixel = 12'h000;
                4'd7: pixel = 12'hFEA;
                4'd8: pixel = 12'hFEA;
                4'd9: pixel = 12'h337;
                4'd10: pixel = 12'h111;
                4'd11: pixel = 12'h337;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd8: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'hFEA;
                4'd6: pixel = 12'h000;
                4'd7: pixel = 12'hFEA;
                4'd8: pixel = 12'hFEA;
                4'd9: pixel = 12'h111;
                4'd10: pixel = 12'hFEA;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd9: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'hFEA;
                4'd6: pixel = 12'hFEA;
                4'd7: pixel = 12'hFEA;
                4'd8: pixel = 12'hFEA;
                4'd9: pixel = 12'hFEA;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd10: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'h000;
                4'd7: pixel = 12'h000;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'h000;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd11: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'hFEA;
                4'd7: pixel = 12'hFEA;
                4'd8: pixel = 12'hF30;
                4'd9: pixel = 12'h000;
                4'd10: pixel = 12'hF30;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd12: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'hFEA;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'hF30;
                4'd7: pixel = 12'hF30;
                4'd8: pixel = 12'hF30;
                4'd9: pixel = 12'hF30;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'hF30;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd13: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'h000;
                4'd7: pixel = 12'h000;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'h000;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'hFEA;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd14: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'hF30;
                4'd7: pixel = 12'hF30;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'hF30;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd15: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'hFEA;
                4'd6: pixel = 12'hFEA;
                4'd7: pixel = 12'h000;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'hFEA;
                4'd10: pixel = 12'hFEA;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            default: pixel = 12'hFFF;
        endcase

        {R, G, B} = pixel;
    end
endmodule

module player_sprite_rom_right(
    input  logic [3:0] row,
    input  logic [3:0] col,
    output logic [3:0] R, G, B
);
    logic [11:0] pixel;

    always_comb begin
        case (row)
            4'd0: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'hFFF;
                4'd5: pixel = 12'hFFF;
                4'd6: pixel = 12'hFFF;
                4'd7: pixel = 12'hFFF;
                4'd8: pixel = 12'hFFF;
                4'd9: pixel = 12'hFFF;
                4'd10: pixel = 12'hFFF;
                4'd11: pixel = 12'hFFF;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd1: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'hFFF;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'h000;
                4'd7: pixel = 12'h000;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'h000;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'hFFF;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd2: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'h337;
                4'd7: pixel = 12'h337;
                4'd8: pixel = 12'h337;
                4'd9: pixel = 12'h337;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd3: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h337;
                4'd6: pixel = 12'h337;
                4'd7: pixel = 12'h337;
                4'd8: pixel = 12'h337;
                4'd9: pixel = 12'h337;
                4'd10: pixel = 12'h337;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd4: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'h337;
                4'd5: pixel = 12'h337;
                4'd6: pixel = 12'h337;
                4'd7: pixel = 12'h337;
                4'd8: pixel = 12'h337;
                4'd9: pixel = 12'h337;
                4'd10: pixel = 12'h337;
                4'd11: pixel = 12'h337;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd5: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'h337;
                4'd5: pixel = 12'h337;
                4'd6: pixel = 12'h337;
                4'd7: pixel = 12'h337;
                4'd8: pixel = 12'h337;
                4'd9: pixel = 12'h337;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd6: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'h337;
                4'd5: pixel = 12'h337;
                4'd6: pixel = 12'h337;
                4'd7: pixel = 12'h337;
                4'd8: pixel = 12'hFEA;
                4'd9: pixel = 12'hFEA;
                4'd10: pixel = 12'h337;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd7: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'h337;
                4'd5: pixel = 12'h111;
                4'd6: pixel = 12'h337;
                4'd7: pixel = 12'hFEA;
                4'd8: pixel = 12'hFEA;
                4'd9: pixel = 12'h000;
                4'd10: pixel = 12'hFEA;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd8: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'hFEA;
                4'd6: pixel = 12'h111;
                4'd7: pixel = 12'hFEA;
                4'd8: pixel = 12'hFEA;
                4'd9: pixel = 12'h000;
                4'd10: pixel = 12'hFEA;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd9: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'hFEA;
                4'd7: pixel = 12'hFEA;
                4'd8: pixel = 12'hFEA;
                4'd9: pixel = 12'hFEA;
                4'd10: pixel = 12'hFEA;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd10: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'h000;
                4'd7: pixel = 12'h000;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'h000;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd11: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'hF30;
                4'd6: pixel = 12'h000;
                4'd7: pixel = 12'hF30;
                4'd8: pixel = 12'hFEA;
                4'd9: pixel = 12'hFEA;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'hFFF;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd12: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'hF30;
                4'd6: pixel = 12'hF30;
                4'd7: pixel = 12'h000;
                4'd8: pixel = 12'hF30;
                4'd9: pixel = 12'hF30;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'hFFF;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd13: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'hFEA;
                4'd7: pixel = 12'hFEA;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'h000;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'hFFF;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd14: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'h000;
                4'd7: pixel = 12'h000;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'hF30;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd15: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'hFEA;
                4'd6: pixel = 12'hFEA;
                4'd7: pixel = 12'h000;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'hFEA;
                4'd10: pixel = 12'hFEA;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            default: pixel = 12'hFFF;
        endcase

        {R, G, B} = pixel;
    end
endmodule

module player_sprite_rom_up(
    input  logic [3:0] row,
    input  logic [3:0] col,
    output logic [3:0] R, G, B
);
    logic [11:0] pixel;

    always_comb begin
        case (row)
            4'd0: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'hFFF;
                4'd5: pixel = 12'hFFF;
                4'd6: pixel = 12'hFFF;
                4'd7: pixel = 12'hFFF;
                4'd8: pixel = 12'hFFF;
                4'd9: pixel = 12'hFFF;
                4'd10: pixel = 12'hFFF;
                4'd11: pixel = 12'hFFF;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd1: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'hFFF;
                4'd5: pixel = 12'hFFF;
                4'd6: pixel = 12'h000;
                4'd7: pixel = 12'h000;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'h000;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'hFFF;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd2: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'h000;
                4'd7: pixel = 12'h337;
                4'd8: pixel = 12'h337;
                4'd9: pixel = 12'h337;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd3: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h337;
                4'd6: pixel = 12'h337;
                4'd7: pixel = 12'h337;
                4'd8: pixel = 12'h337;
                4'd9: pixel = 12'h337;
                4'd10: pixel = 12'h337;
                4'd11: pixel = 12'h337;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd4: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'h337;
                4'd7: pixel = 12'h337;
                4'd8: pixel = 12'h337;
                4'd9: pixel = 12'h337;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'h337;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd5: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h337;
                4'd6: pixel = 12'h337;
                4'd7: pixel = 12'h337;
                4'd8: pixel = 12'h337;
                4'd9: pixel = 12'h337;
                4'd10: pixel = 12'h337;
                4'd11: pixel = 12'h337;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd6: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h337;
                4'd6: pixel = 12'h337;
                4'd7: pixel = 12'h337;
                4'd8: pixel = 12'h337;
                4'd9: pixel = 12'h337;
                4'd10: pixel = 12'h337;
                4'd11: pixel = 12'h337;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'h000;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd7: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'hFEA;
                4'd5: pixel = 12'h337;
                4'd6: pixel = 12'h337;
                4'd7: pixel = 12'h337;
                4'd8: pixel = 12'h337;
                4'd9: pixel = 12'h337;
                4'd10: pixel = 12'h337;
                4'd11: pixel = 12'h337;
                4'd12: pixel = 12'hFEA;
                4'd13: pixel = 12'h000;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd8: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h337;
                4'd6: pixel = 12'h337;
                4'd7: pixel = 12'h337;
                4'd8: pixel = 12'h337;
                4'd9: pixel = 12'h337;
                4'd10: pixel = 12'h337;
                4'd11: pixel = 12'h337;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'h000;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd9: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'hFEA;
                4'd7: pixel = 12'hFEA;
                4'd8: pixel = 12'hFEA;
                4'd9: pixel = 12'hFEA;
                4'd10: pixel = 12'hFEA;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'h000;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd10: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'hF30;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'h000;
                4'd7: pixel = 12'h000;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'h000;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'hF30;
                4'd12: pixel = 12'hF30;
                4'd13: pixel = 12'h000;
                4'd14: pixel = 12'h000;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd11: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'hF30;
                4'd7: pixel = 12'hF30;
                4'd8: pixel = 12'hF30;
                4'd9: pixel = 12'hF30;
                4'd10: pixel = 12'hF30;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'hF30;
                4'd13: pixel = 12'hFEA;
                4'd14: pixel = 12'h000;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd12: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'hFEA;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'h000;
                4'd7: pixel = 12'h000;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'h000;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'hFEA;
                4'd14: pixel = 12'h000;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd13: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'h000;
                4'd4: pixel = 12'h000;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'hF30;
                4'd7: pixel = 12'hF30;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'hF30;
                4'd10: pixel = 12'hF30;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'h000;
                4'd13: pixel = 12'h000;
                4'd14: pixel = 12'h000;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd14: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'hFFF;
                4'd5: pixel = 12'h000;
                4'd6: pixel = 12'h000;
                4'd7: pixel = 12'hFEA;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'hF30;
                4'd10: pixel = 12'hF30;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            4'd15: case (col)
                4'd0: pixel = 12'hFFF;
                4'd1: pixel = 12'hFFF;
                4'd2: pixel = 12'hFFF;
                4'd3: pixel = 12'hFFF;
                4'd4: pixel = 12'hFFF;
                4'd5: pixel = 12'hFFF;
                4'd6: pixel = 12'h000;
                4'd7: pixel = 12'h000;
                4'd8: pixel = 12'h000;
                4'd9: pixel = 12'hFEA;
                4'd10: pixel = 12'hFEA;
                4'd11: pixel = 12'h000;
                4'd12: pixel = 12'hFFF;
                4'd13: pixel = 12'hFFF;
                4'd14: pixel = 12'hFFF;
                4'd15: pixel = 12'hFFF;
                default: pixel = 12'hFFF;
            endcase
            default: pixel = 12'hFFF;
        endcase

        {R, G, B} = pixel;
    end
endmodule
