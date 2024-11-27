module RegDA_tb;

    reg [31:0] pc_in;
    reg [6:0] opcode_in;
    reg [4:0] dest_reg_addr_in;
    reg [2:0] funct3_in;
    reg signed [31:0] src_reg1_data_in;
    reg signed [31:0] src_reg2_data_in;
    reg [4:0] src_reg1_addr_in;
    reg [4:0] src_reg2_addr_in;
    reg [6:0] funct7_in;
    reg signed [31:0] imm_data_in;
    reg [1:0] op1_in;
    reg [1:0] op2_in;
    reg signed [31:0] alu_mem_data_in;
    reg signed [31:0] wb_data_in;
    reg jal_en_in;
    reg jalr_en_in;
    reg forward_op1_in;
    reg forward_op2_in;

    wire [31:0] pc_out;
    wire [6:0] opcode_out;
    wire [4:0] dest_reg_addr_out;
    wire [2:0] funct3_out;
    wire signed [31:0] src_reg1_data_out;
    wire signed [31:0] src_reg2_data_out;
    wire [4:0] src_reg1_addr_out;
    wire [4:0] src_reg2_addr_out;
    wire [6:0] funct7_out;
    wire signed [31:0] imm_data_out;
    wire [1:0] op1_out;
    wire [1:0] op2_out;
    wire jal_en_out;
    wire jalr_en_out;

    RegDA uut (
        .pc_in(pc_in),
        .opcode_in(opcode_in),
        .dest_reg_addr_in(dest_reg_addr_in),
        .funct3_in(funct3_in),
        .src_reg1_data_in(src_reg1_data_in),
        .src_reg2_data_in(src_reg2_data_in),
        .src_reg1_addr_in(src_reg1_addr_in),
        .src_reg2_addr_in(src_reg2_addr_in),
        .funct7_in(funct7_in),
        .imm_data_in(imm_data_in),
        .op1_in(op1_in),
        .op2_in(op2_in),
        .alu_mem_data_in(alu_mem_data_in),
        .wb_data_in(wb_data_in),
        .jal_en_in(jal_en_in),
        .jalr_en_in(jalr_en_in),
        .forward_op1_in(forward_op1_in),
        .forward_op2_in(forward_op2_in),

        .pc_out(pc_out),
        .opcode_out(opcode_out),
        .dest_reg_addr_out(dest_reg_addr_out),
        .funct3_out(funct3_out),
        .src_reg1_data_out(src_reg1_data_out),
        .src_reg2_data_out(src_reg2_data_out),
        .src_reg1_addr_out(src_reg1_addr_out),
        .src_reg2_addr_out(src_reg2_addr_out),
        .funct7_out(funct7_out),
        .imm_data_out(imm_data_out),
        .op1_out(op1_out),
        .op2_out(op2_out),
        .jal_en_out(jal_en_out),
        .jalr_en_out(jalr_en_out)
    );

    integer file;
    integer status;


    initial begin
        file = $fopen("input.txt", "r");
        while (!$feof(file)) begin
            status = $fscanf(file, "%h %h %h %h %h %h %h %h %h %h %h %h %h %h %b %b %b %b",
                             pc_in, opcode_in, dest_reg_addr_in, funct3_in, 
                             src_reg1_data_in, src_reg2_data_in, src_reg1_addr_in,
                             src_reg2_addr_in, funct7_in, imm_data_in, op1_in,
                             op2_in, alu_mem_data_in, wb_data_in, jal_en_in, jalr_en_in,
                             forward_op1_in, forward_op2_in);

            if (status == 18) begin
                #10; 
                $display("%h", pc_out);
                $display("%h", opcode_out);
                $display("%h", dest_reg_addr_out);
                $display("%h", funct3_out);
                $display("%h", src_reg1_data_out);
                $display("%h", src_reg2_data_out);
                $display("%h", src_reg1_addr_out);
                $display("%h", src_reg2_addr_out);
                $display("%h", funct7_out);
                $display("%h", imm_data_out);
                $display("%h", op1_out);
                $display("%h", op2_out);
                $display("%b", jal_en_out);
                $display("%b", jalr_en_out);
                $display("-"); 
            end
        end
        $fclose(file);
        $finish;
    end
endmodule
