interface bcd_adder_if;
    logic [3:0] A;
    logic [3:0] B;
    logic  Cin;
    logic [3:0] S;
    logic Cout;
endinterface

module bcd_adder_tb();
bcd_adder_if bcd_if();
logic [3:0] A_tb;
logic [3:0] B_tb;
logic Cin_tb;
logic [3:0] S_tb;
logic Cout_tb;
assign bcd_if.A   = A_tb;
assign bcd_if.B   = B_tb;
assign bcd_if.Cin = Cin_tb;
assign S_tb       = bcd_if.S;
assign Cout_tb    = bcd_if.Cout;
binary_adder dut(.A   (bcd_if.A),.B   (bcd_if.B),.Cin (bcd_if.Cin),.S   (bcd_if.S),.Cout(bcd_if.Cout));
initial begin
    A_tb   = 4'd2;
    B_tb   = 4'd3;
    Cin_tb = 1'b0;
    #10;
    A_tb   = 4'd7;
    B_tb   = 4'd2;
    Cin_tb = 1'b0;
    #10;
    A_tb   = 4'd8;
    B_tb   = 4'd5;
    Cin_tb = 1'b0;
    #10;
    A_tb   = 4'd9;
    B_tb   = 4'd8;
    Cin_tb = 1'b1;
    #10;
    $finish;
end
initial begin
    $monitor("Time=%0t A=%0d B=%0d Cin=%b Cout=%b S=%0d",$time,A_tb,B_tb,Cin_tb,Cout_tb,S_tb);
end

endmodule
