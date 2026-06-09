module binary_adder_tb();
reg [3:0]a_tb;
reg [3:0]b_tb;
reg cin_tb;
wire [3:0]sum_tb;
wire cout_tb;
binary_adder ba1(a_tb,b_tb,cin_tb,sum_tb,cout_tb);
initial
begin
{a_tb,b_tb,cin_tb}=0;
end
initial
begin
a_tb=4'b0110;
b_tb=4'b1000;
cin_tb=1'b1;
#1
a_tb=4'b1001;
b_tb=4'b0000;
cin_tb=1'b0;
#1
a_tb=4'b0011;
b_tb=4'b1001;
cin_tb=1'b1;
#1
a_tb=4'b0010;
b_tb=4'b0001;
cin_tb=1'b1;
#1;
$finish;
end
endmodule
