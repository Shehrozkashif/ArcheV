module alu_tb;
    reg [31:0] pc_in;
    reg signed [31:0] src1_data;
    reg signed [31:0] src2_data;
    reg signed [31:0] imm_val;
    reg imm_sel;
    reg add_en;
    reg sll_en;
    reg slt_en;
    reg xor_en;
    reg srl_en;
    reg sra_en;
    reg or_en;
    reg and_en;
    reg sub_en;
    reg jalr_en;
    reg jal_en;
    reg auipc_en;
    reg lui_en;
    wire signed [31:0] result_out;

    alu uut (
        .pc_in(pc_in),
        .src1_data(src1_data),
        .src2_data(src2_data),
        .imm_val(imm_val),
        .imm_sel(imm_sel),
        .add_en(add_en),
        .sll_en(sll_en),
        .slt_en(slt_en),
        .xor_en(xor_en),
        .srl_en(srl_en),
        .sra_en(sra_en),
        .or_en(or_en),
        .and_en(and_en),
        .sub_en(sub_en),
        .jalr_en(jalr_en),
        .jal_en(jal_en),
        .auipc_en(auipc_en),
        .lui_en(lui_en),
        .result_out(result_out)
    );

    integer file;
    integer status;

    initial begin
        file = $fopen("input.txt", "r");
        while (!$feof(file)) begin
            status = $fscanf(file, "%h %h %h %h %b %b %b %b %b %b %b %b %b %b %b %b %b %b",
                             pc_in, src1_data, src2_data,
                             imm_val, imm_sel,
                             add_en, sub_en,
                             and_en, or_en,
                             xor_en, sll_en,
                             srl_en, sra_en,
                             slt_en, jalr_en,
                             jal_en, auipc_en, lui_en);

            if (status == 18) begin
                #10; 
                $display("%h", result_out);
                $display("-"); 
            end
        end
        $fclose(file);
        $finish;
    end
endmodule
