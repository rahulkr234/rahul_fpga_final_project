module wall_tile_rom(
    input  logic [3:0] row,
    input  logic [3:0] col,
    output logic [3:0] R, G, B
);
    logic [11:0] pixel;

    always_comb begin
        case (row)
            4'd0: case (col)
                4'd0: pixel = 12'h666;
                4'd1: pixel = 12'h444;
                4'd2: pixel = 12'h444;
                4'd3: pixel = 12'h666;
                4'd4: pixel = 12'h555;
                4'd5: pixel = 12'h655;
                4'd6: pixel = 12'h333;
                4'd7: pixel = 12'h444;
                4'd8: pixel = 12'h444;
                4'd9: pixel = 12'h555;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'h444;
                4'd12: pixel = 12'h444;
                4'd13: pixel = 12'h444;
                4'd14: pixel = 12'h444;
                4'd15: pixel = 12'h888;
                default: pixel = 12'h000;
            endcase
            4'd1: case (col)
                4'd0: pixel = 12'h444;
                4'd1: pixel = 12'h999;
                4'd2: pixel = 12'h777;
                4'd3: pixel = 12'h666;
                4'd4: pixel = 12'h555;
                4'd5: pixel = 12'h777;
                4'd6: pixel = 12'h555;
                4'd7: pixel = 12'h555;
                4'd8: pixel = 12'h666;
                4'd9: pixel = 12'h555;
                4'd10: pixel = 12'h111;
                4'd11: pixel = 12'h555;
                4'd12: pixel = 12'h666;
                4'd13: pixel = 12'h666;
                4'd14: pixel = 12'h666;
                4'd15: pixel = 12'h677;
                default: pixel = 12'h000;
            endcase
            4'd2: case (col)
                4'd0: pixel = 12'h666;
                4'd1: pixel = 12'h555;
                4'd2: pixel = 12'h555;
                4'd3: pixel = 12'h444;
                4'd4: pixel = 12'h555;
                4'd5: pixel = 12'h444;
                4'd6: pixel = 12'h555;
                4'd7: pixel = 12'h656;
                4'd8: pixel = 12'h556;
                4'd9: pixel = 12'h555;
                4'd10: pixel = 12'h101;
                4'd11: pixel = 12'h555;
                4'd12: pixel = 12'h555;
                4'd13: pixel = 12'h555;
                4'd14: pixel = 12'h555;
                4'd15: pixel = 12'h323;
                default: pixel = 12'h000;
            endcase
            4'd3: case (col)
                4'd0: pixel = 12'h888;
                4'd1: pixel = 12'hA9A;
                4'd2: pixel = 12'h333;
                4'd3: pixel = 12'h888;
                4'd4: pixel = 12'h777;
                4'd5: pixel = 12'hAAA;
                4'd6: pixel = 12'h888;
                4'd7: pixel = 12'h333;
                4'd8: pixel = 12'h999;
                4'd9: pixel = 12'hAAA;
                4'd10: pixel = 12'h999;
                4'd11: pixel = 12'hAAB;
                4'd12: pixel = 12'hAAA;
                4'd13: pixel = 12'h555;
                4'd14: pixel = 12'h777;
                4'd15: pixel = 12'h999;
                default: pixel = 12'h000;
            endcase
            4'd4: case (col)
                4'd0: pixel = 12'h555;
                4'd1: pixel = 12'h555;
                4'd2: pixel = 12'h666;
                4'd3: pixel = 12'h555;
                4'd4: pixel = 12'h555;
                4'd5: pixel = 12'h555;
                4'd6: pixel = 12'h666;
                4'd7: pixel = 12'h777;
                4'd8: pixel = 12'h444;
                4'd9: pixel = 12'h555;
                4'd10: pixel = 12'h555;
                4'd11: pixel = 12'h556;
                4'd12: pixel = 12'h555;
                4'd13: pixel = 12'h666;
                4'd14: pixel = 12'h555;
                4'd15: pixel = 12'h666;
                default: pixel = 12'h000;
            endcase
            4'd5: case (col)
                4'd0: pixel = 12'h555;
                4'd1: pixel = 12'h666;
                4'd2: pixel = 12'h556;
                4'd3: pixel = 12'h555;
                4'd4: pixel = 12'h445;
                4'd5: pixel = 12'h555;
                4'd6: pixel = 12'h666;
                4'd7: pixel = 12'h222;
                4'd8: pixel = 12'h666;
                4'd9: pixel = 12'h555;
                4'd10: pixel = 12'h555;
                4'd11: pixel = 12'h444;
                4'd12: pixel = 12'h666;
                4'd13: pixel = 12'h666;
                4'd14: pixel = 12'h555;
                4'd15: pixel = 12'h555;
                default: pixel = 12'h000;
            endcase
            4'd6: case (col)
                4'd0: pixel = 12'h877;
                4'd1: pixel = 12'h999;
                4'd2: pixel = 12'hBBB;
                4'd3: pixel = 12'hBBB;
                4'd4: pixel = 12'hAAA;
                4'd5: pixel = 12'h555;
                4'd6: pixel = 12'hAAA;
                4'd7: pixel = 12'h777;
                4'd8: pixel = 12'h999;
                4'd9: pixel = 12'h999;
                4'd10: pixel = 12'h333;
                4'd11: pixel = 12'h555;
                4'd12: pixel = 12'hAAA;
                4'd13: pixel = 12'hBBB;
                4'd14: pixel = 12'hAAA;
                4'd15: pixel = 12'h333;
                default: pixel = 12'h000;
            endcase
            4'd7: case (col)
                4'd0: pixel = 12'h444;
                4'd1: pixel = 12'h444;
                4'd2: pixel = 12'h555;
                4'd3: pixel = 12'h656;
                4'd4: pixel = 12'h545;
                4'd5: pixel = 12'h444;
                4'd6: pixel = 12'h444;
                4'd7: pixel = 12'h555;
                4'd8: pixel = 12'h555;
                4'd9: pixel = 12'h333;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'h555;
                4'd12: pixel = 12'h444;
                4'd13: pixel = 12'h555;
                4'd14: pixel = 12'h666;
                4'd15: pixel = 12'h666;
                default: pixel = 12'h000;
            endcase
            4'd8: case (col)
                4'd0: pixel = 12'h666;
                4'd1: pixel = 12'h555;
                4'd2: pixel = 12'h444;
                4'd3: pixel = 12'h555;
                4'd4: pixel = 12'h222;
                4'd5: pixel = 12'h666;
                4'd6: pixel = 12'h555;
                4'd7: pixel = 12'h555;
                4'd8: pixel = 12'h555;
                4'd9: pixel = 12'h545;
                4'd10: pixel = 12'h222;
                4'd11: pixel = 12'h555;
                4'd12: pixel = 12'h555;
                4'd13: pixel = 12'h555;
                4'd14: pixel = 12'h444;
                4'd15: pixel = 12'h444;
                default: pixel = 12'h000;
            endcase
            4'd9: case (col)
                4'd0: pixel = 12'hAAA;
                4'd1: pixel = 12'h888;
                4'd2: pixel = 12'h222;
                4'd3: pixel = 12'h888;
                4'd4: pixel = 12'h777;
                4'd5: pixel = 12'hAAA;
                4'd6: pixel = 12'h888;
                4'd7: pixel = 12'h444;
                4'd8: pixel = 12'h999;
                4'd9: pixel = 12'hAAA;
                4'd10: pixel = 12'h888;
                4'd11: pixel = 12'h999;
                4'd12: pixel = 12'hAAA;
                4'd13: pixel = 12'h555;
                4'd14: pixel = 12'h999;
                4'd15: pixel = 12'hBBB;
                default: pixel = 12'h000;
            endcase
            4'd10: case (col)
                4'd0: pixel = 12'h555;
                4'd1: pixel = 12'h445;
                4'd2: pixel = 12'h111;
                4'd3: pixel = 12'h555;
                4'd4: pixel = 12'h555;
                4'd5: pixel = 12'h555;
                4'd6: pixel = 12'h656;
                4'd7: pixel = 12'h555;
                4'd8: pixel = 12'h444;
                4'd9: pixel = 12'h555;
                4'd10: pixel = 12'h555;
                4'd11: pixel = 12'h666;
                4'd12: pixel = 12'h655;
                4'd13: pixel = 12'h555;
                4'd14: pixel = 12'h555;
                4'd15: pixel = 12'h555;
                default: pixel = 12'h000;
            endcase
            4'd11: case (col)
                4'd0: pixel = 12'h555;
                4'd1: pixel = 12'h555;
                4'd2: pixel = 12'h111;
                4'd3: pixel = 12'h444;
                4'd4: pixel = 12'h555;
                4'd5: pixel = 12'h666;
                4'd6: pixel = 12'h555;
                4'd7: pixel = 12'h333;
                4'd8: pixel = 12'h555;
                4'd9: pixel = 12'h545;
                4'd10: pixel = 12'h545;
                4'd11: pixel = 12'h555;
                4'd12: pixel = 12'h666;
                4'd13: pixel = 12'h444;
                4'd14: pixel = 12'h656;
                4'd15: pixel = 12'h555;
                default: pixel = 12'h000;
            endcase
            4'd12: case (col)
                4'd0: pixel = 12'h777;
                4'd1: pixel = 12'hAAA;
                4'd2: pixel = 12'hBBB;
                4'd3: pixel = 12'hBBB;
                4'd4: pixel = 12'hAAA;
                4'd5: pixel = 12'h333;
                4'd6: pixel = 12'h778;
                4'd7: pixel = 12'h888;
                4'd8: pixel = 12'h888;
                4'd9: pixel = 12'hBBA;
                4'd10: pixel = 12'h111;
                4'd11: pixel = 12'h777;
                4'd12: pixel = 12'h777;
                4'd13: pixel = 12'h999;
                4'd14: pixel = 12'hBBA;
                4'd15: pixel = 12'h666;
                default: pixel = 12'h000;
            endcase
            4'd13: case (col)
                4'd0: pixel = 12'h444;
                4'd1: pixel = 12'h555;
                4'd2: pixel = 12'h555;
                4'd3: pixel = 12'h555;
                4'd4: pixel = 12'h555;
                4'd5: pixel = 12'h555;
                4'd6: pixel = 12'h555;
                4'd7: pixel = 12'h555;
                4'd8: pixel = 12'h555;
                4'd9: pixel = 12'h556;
                4'd10: pixel = 12'h000;
                4'd11: pixel = 12'h444;
                4'd12: pixel = 12'h333;
                4'd13: pixel = 12'h656;
                4'd14: pixel = 12'h656;
                4'd15: pixel = 12'h666;
                default: pixel = 12'h000;
            endcase
            4'd14: case (col)
                4'd0: pixel = 12'h444;
                4'd1: pixel = 12'h555;
                4'd2: pixel = 12'h555;
                4'd3: pixel = 12'h444;
                4'd4: pixel = 12'h555;
                4'd5: pixel = 12'h666;
                4'd6: pixel = 12'h555;
                4'd7: pixel = 12'h656;
                4'd8: pixel = 12'h544;
                4'd9: pixel = 12'h555;
                4'd10: pixel = 12'h111;
                4'd11: pixel = 12'h555;
                4'd12: pixel = 12'h666;
                4'd13: pixel = 12'h555;
                4'd14: pixel = 12'h555;
                4'd15: pixel = 12'h444;
                default: pixel = 12'h000;
            endcase
            4'd15: case (col)
                4'd0: pixel = 12'h444;
                4'd1: pixel = 12'h333;
                4'd2: pixel = 12'h222;
                4'd3: pixel = 12'h333;
                4'd4: pixel = 12'h222;
                4'd5: pixel = 12'h222;
                4'd6: pixel = 12'h222;
                4'd7: pixel = 12'h222;
                4'd8: pixel = 12'h222;
                4'd9: pixel = 12'h222;
                4'd10: pixel = 12'h222;
                4'd11: pixel = 12'h222;
                4'd12: pixel = 12'h222;
                4'd13: pixel = 12'h222;
                4'd14: pixel = 12'h222;
                4'd15: pixel = 12'h111;
                default: pixel = 12'h000;
            endcase
            default: pixel = 12'h000;
        endcase

        {R, G, B} = pixel;
    end
endmodule