module write_back_tb;
    reg signed [31:0] alu_result;  
    reg  signed [31:0] mem_data;  
    reg  load_data_sel;  
    wire  signed [31:0] wb_data;     
    
    write_back uut (
        .alu_result(alu_result),
        .mem_data(mem_data),
        .load_data_sel(load_data_sel),
        .wb_data(wb_data)
    );

    integer file;
    integer result;
    integer status;

    initial begin
        file = $fopen("input.txt", "r");
       
        while (!$feof(file)) begin
            status = $fscanf(file, "%h %h %b", alu_result, mem_data, load_data_sel);
            if (status == 3) 
            begin
                #10;
                $display("%h", wb_data);
                $display("-");
            end
        end
        $fclose(file);
        $finish;
    end
endmodule
