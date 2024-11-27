module RegMW_testbench;

    reg signed [31:0] alu_data_in;
    reg [31:0] load_data_in;
    reg [4:0] dest_reg_addr_in;
    reg write_enable_in;
    reg load_enable_in;

    wire signed [31:0] alu_data_out;
    wire [31:0] load_data_out;
    wire [4:0] dest_reg_addr_out;
    wire write_enable_out;
    wire load_enable_out;

    RegMW uut (
        .alu_data_in(alu_data_in),
        .load_data_in(load_data_in),
        .dest_reg_addr_in(dest_reg_addr_in),
        .write_enable_in(write_enable_in),
        .load_enable_in(load_enable_in),
        .alu_data_out(alu_data_out),
        .load_data_out(load_data_out),
        .dest_reg_addr_out(dest_reg_addr_out),
        .write_enable_out(write_enable_out),
        .load_enable_out(load_enable_out)
    );

    integer file, status;
    reg [31:0] pc_in, src1_data, src2_data, imm_val;
    reg imm_sel;
    reg add_en, sub_en, and_en, or_en, xor_en;
    reg sll_en, srl_en, sra_en, slt_en, jalr_en, jal_en, auipc_en, lui_en;
    wire [31:0] result_out;

    initial begin
        file = $fopen("input.txt", "r");
        
        while (!$feof(file)) begin
            status = $fscanf(file, "%h %h %h %b %b",
                             alu_data_in, load_data_in, dest_reg_addr_in,
                             write_enable_in, load_enable_in);

            if (status == 5) begin
                #10; 
                $display("%h", alu_data_out);
                $display("%h", load_data_out);
                $display("%h", dest_reg_addr_out);
                $display("%b", write_enable_out);
                $display("%b", load_enable_out);
                $display("-"); 
            end
        end

        // Close the file
        $fclose(file);
        $finish;
    end
endmodule
