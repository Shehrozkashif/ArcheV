module stall_unit_tb;
    reg [31:0] RegFD_inst;  
    reg load_En;  
    reg [4:0] RegDA_rd_addr;  
    reg [31:0] pc_in;  
    reg [31:0] stallPC_in;  
    reg [4:0] rs1_addr;  
    reg [4:0] rs2_addr;  

    wire forward_inst;  
    wire forward_PC;  
    wire stallControl;  
    wire [31:0] inst;  
    wire [31:0] PC_out;  
    wire [31:0] stallPC_out;  
    
    stall_unit uut (
        .RegFD_inst(RegFD_inst),
        .load_En(load_En),
        .RegDA_rd_addr(RegDA_rd_addr),
        .pc_in(pc_in),
        .stallPC_in(stallPC_in),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr),
        .forward_inst(forward_inst),
        .forward_PC(forward_PC),
        .stallControl(stallControl),
        .inst(inst),
        .PC_out(PC_out),
        .stallPC_out(stallPC_out)
    );

    integer file;
    integer status;

    initial begin
        file = $fopen("input.txt", "r");
       
        while (!$feof(file)) begin
            status = $fscanf(file, "%h %b %h %h %h %h %h",
                             RegFD_inst, load_En, RegDA_rd_addr, pc_in,
                             stallPC_in, rs1_addr, rs2_addr);
            if (status == 7) 
            begin
                #10;
                $display("%b", forward_inst);
                $display("%b", forward_PC);
                $display("%b", stallControl);
                $display("%h", inst);
                $display("%h", PC_out);
                $display("%h", stallPC_out);
                $display("-");

            end
        end
        $fclose(file);
        $finish;
    end
endmodule
