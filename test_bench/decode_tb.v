module decode_tb;
    reg [31:0] instruction;  

    wire [6:0] opcode;  
    wire [4:0] rd_addr;  
    wire [2:0] func3;  
    wire [4:0] rs1_addr;  
    wire [4:0] rs2_addr;  
    wire [6:0] func7;  
    wire signed[31:0] imm;  
    wire [6:0] r_id;  
    wire [6:0] i_math_id;  
    wire [6:0] i_load_id;  
    wire [9:0] i_jalr_id;  
    wire [6:0] s_id;  
    wire [6:0] b_id;  
    wire [6:0] u_auipc_id;  
    wire [6:0] u_lui_id;  
    wire [6:0] j_id;  
    
    decode uut (
        .instruction(instruction),
        .opcode(opcode),
        .rd_addr(rd_addr),
        .func3(func3),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr),
        .func7(func7),
        .imm(imm),
        .r_id(r_id),
        .i_math_id(i_math_id),
        .i_load_id(i_load_id),
        .i_jalr_id(i_jalr_id),
        .s_id(s_id),
        .b_id(b_id),
        .u_auipc_id(u_auipc_id),
        .u_lui_id(u_lui_id),
        .j_id(j_id)
    );

    integer file;
    integer status;

    initial begin
        file = $fopen("input.txt", "r");
       
        while (!$feof(file)) begin
            status = $fscanf(file, "%h",
                             instruction);
            if (status == 1) 
            begin
                #10;
                $display("%h", opcode);
                $display("%h", rd_addr);
                $display("%h", func3);
                $display("%h", rs1_addr);
                $display("%h", rs2_addr);
                $display("%h", func7);
                $display("%h", imm);
                $display("%h", r_id);
                $display("%h", i_math_id);
                $display("%h", i_load_id);
                $display("%h", i_jalr_id);
                $display("%h", s_id);
                $display("%h", b_id);
                $display("%h", u_auipc_id);
                $display("%h", u_lui_id);
                $display("%h", j_id);
                $display("-");

            end
        end
        $fclose(file);
        $finish;
    end
endmodule
