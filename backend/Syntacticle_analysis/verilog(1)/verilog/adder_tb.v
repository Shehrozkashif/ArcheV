`timescale 1ns/1ps
module adder_tb();
    reg  a_tb;
    reg  b_tb;
    reg  cin; 

    wire sum;
    wire carry;

    initial begin
        a_tb = 1'b1;
        b_tb = 1'b0;
        cin = 1'b0;
        #5;

        a_tb = 1'b0;
        b_tb = 1'b1;
        cin = 1'b1;
        #5;
    end
    adder adder0(
        .a(a_tb),
        .b(b_tb),
        .cin(cin),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $dumpfile("adder.vcd");
        $dumpvars(0,adder_tb);
    end
endmodule