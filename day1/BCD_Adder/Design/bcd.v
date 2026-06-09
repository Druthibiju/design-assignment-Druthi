module binary_adder(input [3:0]a,input [3:0]b,input cin,output [3:0]sum,output cout);
wire [3:0]s,d;
wire e1,e2;
ripplecarry rca1(a,b,cin,s,e1);
assign e2=(s[3]&s[2])|(s[3]&s[1])|e1;
assign d[3]=1'b0;
assign d[0]=1'b0;
assign d[1]=e2;
assign d[2]=e2;
ripplecarry rca2(s,d,1'b0,sum,cout);

endmodule
