module RegAM_testbench;

    reg signed [31:0] alu_in;
    reg [4:0] rd_addr_in;
    reg signed [31:0] rs2_data_in;
    reg wr_en_in;
    reg str_en_in;
    reg sb_en_in;
    reg sh_en_in;
    reg sw_en_in;
    reg load_en_in;
    reg lb_en_in;
    reg lh_en_in;
    reg lw_en_in;
    reg lbu_en_in;
    reg lhu_en_in;

    wire signed [31:0] alu_out;
    wire [4:0] rd_addr_out;
    wire signed [31:0] rs2_data_out;
    wire wr_en_out;
    wire str_en_out;
    wire load_en_out;
    wire sb_en_out;
    wire sh_en_out;
    wire sw_en_out;
    wire lb_en_out;
    wire lhu_en_out;
    wire lbu_en_out;
    wire lh_en_out;


    RegAM uut (
        .alu_in(alu_in),
        .rd_addr_in(rd_addr_in),
        .rs2_data_in(rs2_data_in),
        .wr_en_in(wr_en_in),
        .str_en_in(str_en_in),
        .sb_en_in(sb_en_in),
        .sh_en_in(sh_en_in),
        .sw_en_in(sw_en_in),
        .load_en_in(load_en_in),
        .lb_en_in(lb_en_in),
        .lh_en_in(lh_en_in),
        .lw_en_in(lw_en_in),
        .lbu_en_in(lbu_en_in),
        .lhu_en_in(lhu_en_in),

        .alu_out(alu_out),
        .rd_addr_out(rd_addr_out),
        .rs2_data_out(rs2_data_out),
        .wr_en_out(wr_en_out),
        .str_en_out(str_en_out),
        .load_en_out(load_en_out),
        .sb_en_out(sb_en_out),
        .sh_en_out(sh_en_out),
        .sw_en_out(sw_en_out),
        .lb_en_out(lb_en_out),
        .lhu_en_out(lhu_en_out),
        .lbu_en_out(lbu_en_out),
        .lh_en_out(lh_en_out)
    );

    integer file;
    integer status;

    initial begin
        file = $fopen("input.txt", "r");
        while (!$feof(file)) begin
            status = $fscanf(file, "%h %h %h %b %b %b %b %b %b %b %b %b %b %b",
                             alu_in, rd_addr_in, rs2_data_in,
                             wr_en_in, str_en_in,
                             sb_en_in, sh_en_in,
                             sw_en_in, load_en_in,
                             lb_en_in, lh_en_in,
                             lw_en_in, lbu_en_in,
                             lhu_en_in);


            if (status == 14) begin 
                #10; 
                $display("%h", alu_out);
                $display("%h", rd_addr_in);
                $display("%h", rs2_data_out);
                $display("%h", wr_en_in);
                $display("%h", str_en_out);
                $display("%h", load_en_out);
                $display("%h", sb_en_out);
                $display("%h", sh_en_out);
                $display("%h", sw_en_out);
                $display("%h", lb_en_out);
                $display("%h", lhu_en_out);
                $display("%h", lbu_en_out);
                $display("%h", lh_en_out);
                $display("-"); 
            end
        end
        $fclose(file);
        $finish;
    end

endmodule

