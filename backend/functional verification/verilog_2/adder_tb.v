module adder_tb();
reg a,b,cin;
wire sum,carry;
adder add(sum,carry,a,b,cin);
initial
begin
a=0;b=0;cin=0;
end

initial 
begin
#1 a=1; b=0; cin=0;
#1 a=1; b=1; cin=0;
#1 a=0; b=1; cin=1;
#1 a=1; b=1; cin=1;
end

initial
begin
$monitor($time," Clock : a=%b,b=%b,cin=%b,sum=%b,carry=%b",a,b,cin,sum,carry);

#6 $finish;
end
endmodule