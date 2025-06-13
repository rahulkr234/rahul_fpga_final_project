module floor_tile_rom(
    input  logic [2:0] row,
    input  logic [2:0] col,
    output logic [3:0] R, G, B
);
    logic [11:0] pixel;

    always_comb begin
        case (row)
            3'd0: case (col)
                3'd0: pixel = 12'h632;
                3'd1: pixel = 12'h632;
                3'd2: pixel = 12'h852;
                3'd3: pixel = 12'h432;
                3'd4: pixel = 12'h632;
                3'd5: pixel = 12'h642;
                3'd6: pixel = 12'h642;
                3'd7: pixel = 12'h632;
                default: pixel = 12'h000;
            endcase
            3'd1: case (col)
                3'd0: pixel = 12'h642;
                3'd1: pixel = 12'h110;
                3'd2: pixel = 12'h632;
                3'd3: pixel = 12'h852;
                3'd4: pixel = 12'h532;
                3'd5: pixel = 12'h632;
                3'd6: pixel = 12'h642;
                3'd7: pixel = 12'h642;
                default: pixel = 12'h000;
            endcase
            3'd2: case (col)
                3'd0: pixel = 12'h642;
                3'd1: pixel = 12'h852;
                3'd2: pixel = 12'h642;
                3'd3: pixel = 12'h532;
                3'd4: pixel = 12'h952;
                3'd5: pixel = 12'h952;
                3'd6: pixel = 12'h432;
                3'd7: pixel = 12'h952;
                default: pixel = 12'h000;
            endcase
            3'd3: case (col)
                3'd0: pixel = 12'h100;
                3'd1: pixel = 12'h211;
                3'd2: pixel = 12'h100;
                3'd3: pixel = 12'h100;
                3'd4: pixel = 12'h100;
                3'd5: pixel = 12'h100;
                3'd6: pixel = 12'h100;
                3'd7: pixel = 12'h110;
                default: pixel = 12'h000;
            endcase
            3'd4: case (col)
                3'd0: pixel = 12'hA62;
                3'd1: pixel = 12'h100;
                3'd2: pixel = 12'h742;
                3'd3: pixel = 12'h742;
                3'd4: pixel = 12'h962;
                3'd5: pixel = 12'h842;
                3'd6: pixel = 12'hA62;
                3'd7: pixel = 12'h743;
                default: pixel = 12'h000;
            endcase
            3'd5: case (col)
                3'd0: pixel = 12'h532;
                3'd1: pixel = 12'h632;
                3'd2: pixel = 12'h642;
                3'd3: pixel = 12'h852;
                3'd4: pixel = 12'h642;
                3'd5: pixel = 12'h642;
                3'd6: pixel = 12'h632;
                3'd7: pixel = 12'h952;
                default: pixel = 12'h000;
            endcase
            3'd6: case (col)
                3'd0: pixel = 12'h852;
                3'd1: pixel = 12'h100;
                3'd2: pixel = 12'h632;
                3'd3: pixel = 12'h642;
                3'd4: pixel = 12'h632;
                3'd5: pixel = 12'h642;
                3'd6: pixel = 12'h632;
                3'd7: pixel = 12'hA62;
                default: pixel = 12'h000;
            endcase
            3'd7: case (col)
                3'd0: pixel = 12'h952;
                3'd1: pixel = 12'h742;
                3'd2: pixel = 12'h532;
                3'd3: pixel = 12'h632;
                3'd4: pixel = 12'h642;
                3'd5: pixel = 12'h642;
                3'd6: pixel = 12'h532;
                3'd7: pixel = 12'h952;
                default: pixel = 12'h000;
            endcase
            default: pixel = 12'h000;
        endcase

        {R, G, B} = pixel;
    end
endmodule