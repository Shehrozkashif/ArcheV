`timescale 1ns / 1ps   // Define timescale for simulation

module adderllm_tb();
    reg a, b, cin;
    wire sum, carry;

    adderllm adderllm (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(carry)
    );
    reg clk;
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end
    initial
begin
a=0;b=0;cin=0;
end

    initial 
begin
#1 a=1; b=0; cin=0;
#1 a=1; b=1; cin=0;
#1 a=0; b=1; cin=1;
#1 a=1; b=1; cin=1;
end

initial
begin
$monitor($time," Clock : a=%b,b=%b,cin=%b,sum=%b,carry=%b",a,b,cin,sum,carry);

#6 $finish;
end
endmodule