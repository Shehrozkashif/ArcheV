module RegFD_testbench;

    reg signed [31:0] pc_in;
    reg [31:0] instruction_in;
    reg [31:0] pc_4;

    wire signed [31:0] pc_out;
    wire [31:0] instruction_out;
    wire [31:0] next_pc_out;


    RegFD uut (
        .pc_in(pc_in),
        .instruction_in(instruction_in),
        .next_pc_in(pc_4),
        .pc_out(pc_out),
        .instruction_out(instruction_out),
        .next_pc_out(next_pc_out)
    );
    integer file;
    integer status;


    initial begin
        file = $fopen("input.txt", "r");
        while (!$feof(file)) begin
            status = $fscanf(file, "%h %h %h",
                             pc_in,instruction_in, pc_4);

            if (status == 3) begin
                #10; 
                $display("%h", pc_out);
                $display("%h", instruction_out);
                $display("%h", next_pc_out);
                $display("-"); 
            end
        end
        $fclose(file);
        $finish;
    end
endmodule
