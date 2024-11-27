module data_mem_router;
    reg signed [31:0] alu_result;
    reg signed [31:0] src_reg2_data;
    reg signed [31:0] mem_data;
    reg load_enable;
    reg store_enable;
    reg store_signed_byte;
    reg store_unsigned_byte;
    reg load_signed_byte;
    reg load_unsigned_byte;
    reg store_signed_halfword;
    reg store_unsigned_halfword;
    reg load_signed_halfword;
    reg load_unsigned_halfword;
    reg store_signed_word;
    reg store_unsigned_word;
    reg load_signed_word;
    reg load_unsigned_word;

    wire signed [31:0] mem_data_out;
    wire signed [31:0] src_reg2_out;
    wire [15:0] address;
    wire store_signal;
    wire load_signal;

    data_mem_router uut (
        .alu_result(alu_result),
        .src_reg2_data(src_reg2_data),
        .mem_data(mem_data),
        .load_enable(load_enable),
        .store_enable(store_enable),
        .store_signed_byte(store_signed_byte),
        .store_unsigned_byte(store_unsigned_byte),
        .load_signed_byte(load_signed_byte),
        .load_unsigned_byte(load_unsigned_byte),
        .store_signed_halfword(store_signed_halfword),
        .store_unsigned_halfword(store_unsigned_halfword),
        .load_signed_halfword(load_signed_halfword),
        .load_unsigned_halfword(load_unsigned_halfword),
        .store_signed_word(store_signed_word),
        .store_unsigned_word(store_unsigned_word),
        .load_signed_word(load_signed_word),
        .load_unsigned_word(load_unsigned_word),

        .mem_data_out(mem_data_out),
        .src_reg2_out(src_reg2_out),
        .address(address),
        .store_signal(store_signal),
        .load_signal(load_signal)
    );

    integer file;
    integer status;

    initial begin
        alu_result = 32'b0;
        src_reg2_data = 32'b0;
        mem_data = 32'b0;
        load_enable = 0;
        store_enable = 0;
        store_signed_byte = 0;
        store_unsigned_byte = 0;
        load_signed_byte = 0;
        load_unsigned_byte = 0;
        store_signed_halfword = 0;
        store_unsigned_halfword = 0;
        load_signed_halfword = 0;
        load_unsigned_halfword = 0;
        store_signed_word = 0;
        store_unsigned_word = 0;
        load_signed_word = 0;
        load_unsigned_word = 0;

        file = $fopen("input.txt", "r");
       
        while (!$feof(file)) begin
            status = $fscanf(file, "%h %h %h %b %b %b %b %b %b %b %b %b %b %b %b %b %b",
                             alu_result, src_reg2_data, mem_data,
                             load_enable, store_enable,
                             store_signed_byte, store_unsigned_byte,
                             load_signed_byte, load_unsigned_byte,
                             store_signed_halfword, store_unsigned_halfword,
                             load_signed_halfword, load_unsigned_halfword,
                             store_signed_word, store_unsigned_word,
                             load_signed_word, load_unsigned_word);

            if (status == 17) begin
                #10; 
                $display("%h", mem_data_out);
                $display("%h", src_reg2_out);
                $display("%h", address);
                $display("%b", store_signal);
                $display("%b", load_signal);
                $display("-");
            end
        end

        $fclose(file);
        $finish;
    end
endmodule
