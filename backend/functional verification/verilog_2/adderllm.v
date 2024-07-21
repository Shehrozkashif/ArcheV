module adderllm(
    input a,        // First operand
    input b,        // Second operand
    input cin,      // Carry in
    output reg sum, // Sum output
    output reg cout // Carry out output
);

    always @(*) begin
        sum = a ^ b ^ cin;  // Sum is XOR of a, b, and cin
        cout = (a & b) | (cin & (a ^ b));  // Carry out logic
    end

endmodule
