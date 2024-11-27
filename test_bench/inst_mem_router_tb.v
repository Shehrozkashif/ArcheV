module Inst_Mem_Router_tb;
    reg [15:0] addrIn;  
    reg jumpStallEn;  
    reg stallEn;  
    reg [31:0] memInstIn;  
    reg [31:0] stallInst;  

    wire [15:0] addrOut;  
    wire [31:0] instOut;  
    
    Inst_Mem_Router uut (
        .addrIn(addrIn),
        .jumpStallEn(jumpStallEn),
        .stallEn(stallEn),
        .memInstIn(memInstIn),
        .stallInst(stallInst),
        .addrOut(addrOut),
        .instOut(instOut)
    );

    integer file;
    integer status;

    initial begin
        file = $fopen("input.txt", "r");
       
        while (!$feof(file)) begin
            status = $fscanf(file, "%h %b %b %h %h",
                             addrIn, jumpStallEn, stallEn, memInstIn, stallInst);
            if (status == 5) 
            begin
                #10;
                $display("%h", addrOut);
                $display("%h", instOut);
                $display("-");

            end
        end
        $fclose(file);
        $finish;
    end
endmodule
