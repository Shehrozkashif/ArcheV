module junp_unit_tb;
    reg signed [31:0] rs1_data;  
    reg signed [31:0] rs2_data;  
    reg signed [31:0] alu;  
    reg signed [31:0] RegAM_alu_out;  
    reg signed [31:0] WriteBack_rd_data;  
    reg signed [31:0] Memory_out;  
    reg [2:0] func3;  
    reg [6:0] b_id;  
    reg [6:0] j_id;  
    reg [9:0] i_jalr_id;  
    reg [6:0] opcode;  
    reg [2:0] forward_jump_operand1;  
    reg [2:0] forward_jump_operand2;  
    reg signed [31:0] imm;  

    wire br_en;  
    wire b_en;  
    wire jal_en;  
    wire jalr_en;  
    wire [31:0] jalr_PC;  
    
    jump_unit uut (
        .rs1_data(rs1_data),
        .rs2_data(rs2_data),
        .alu(alu),
        .RegAM_alu_out(RegAM_alu_out),
        .WriteBack_rd_data(WriteBack_rd_data),
        .Memory_out(Memory_out),
        .func3(func3),
        .b_id(b_id),
        .j_id(j_id),
        .i_jalr_id(i_jalr_id),
        .opcode(opcode),
        .forward_jump_operand1(forward_jump_operand1),
        .forward_jump_operand2(forward_jump_operand2),
        .imm(imm),
        .br_en(br_en),
        .b_en(b_en),
        .jal_en(jal_en),
        .jalr_en(jalr_en),
        .jalr_PC(jalr_PC)
    );

    integer file;
    integer status;

    initial begin
        file = $fopen("input.txt", "r");
       
        while (!$feof(file)) begin
            status = $fscanf(file, "%h %h %h %h %h %h %h %h %h %h %h %h %h %h",
                             rs1_data, rs2_data, alu, RegAM_alu_out,
                             WriteBack_rd_data, Memory_out, func3, b_id,
                             j_id, i_jalr_id, opcode, forward_jump_operand1,
                             forward_jump_operand2, imm);
            if (status == 14) 
            begin
                #10;
                $display("%b", br_en);
                $display("%b", b_en);
                $display("%b", jal_en);
                $display("%b", jalr_en);
                $display("%h", jalr_PC);
            end
        end
        $display("-");
        $fclose(file);
        $finish;
    end
endmodule
