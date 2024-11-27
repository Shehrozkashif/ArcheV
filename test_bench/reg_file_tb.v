module Reg_File_tb;

    reg [4:0] dest_addr;
    reg [31:0] dest_data;
    reg [4:0] src1_addr;
    reg [4:0] src2_addr;
    reg write_enable;

    wire [31:0] src1_data;
    wire [31:0] src2_data;

    RegFile uut (
        .dest_addr(dest_addr),
        .dest_data(dest_data),
        .src1_addr(src1_addr),
        .src2_addr(src2_addr),
        .write_enable(write_enable),
        .src1_data(src1_data),
        .src2_data(src2_data)
    );
    integer file;
    integer status;

    initial begin
       file = $fopen("input.txt", "r");
        while (!$feof(file)) begin
            status = $fscanf(file, "%h %h %h %h %b",
                             dest_addr, dest_data, src1_addr,
                             src2_addr, write_enable);

            if (status == 5) begin
                #10; 
                $display("%h", src1_data);
                $display("%h", src2_data);
                $display("-"); 
            end
        end
        $fclose(file);
        $finish;
    end
endmodule
