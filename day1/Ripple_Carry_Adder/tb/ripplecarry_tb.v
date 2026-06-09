module rca_tb(

    );
    reg [3:0]A;
    reg [3:0]B;
    reg cin;
    wire [3:0]S;
    wire cout;
    ripplecarry rca1(A,B,cin,S,cout);
 initial 
 begin
 {A,B,cin}=0;
 end
initial
 begin
 A=4'b0000;
 B=4'b0000;
 cin=1'b0;
 #1
 A=4'b0010;
 B=4'b0100;
 cin=1'b1;
 #1
 A=4'b1110;
 B=4'b0110;
 cin=1'b1;
 #1
 A=4'b0011;
 B=4'b1100;
 cin=1'b1;
 #1;
 end
endmodule
