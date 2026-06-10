module top_module(input clk, rst,input [7:0] sin,output [7:0] dout);

wire [7:0] sout;
wire [7:0] fifo_out;
wire full, empty;
wire rd_enb;
face_mod fm1(clk,sin,sout);
out_module om1(clk,rst,rd_enb);
fifo ff1(clk,rst,1'b1,rd_enb,sout,full,empty,fifo_out);
assign dout = fifo_out;

endmodule
