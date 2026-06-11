module block_memory_generator(input clk,arst,wr_enb,input [2:0]wr_address,rd_address,input [7:0] data_in,output reg[7:0] data_out);
reg [7:0]mem[7:0];
integer i;
always @(posedge clk or negedge arst) begin
if (!arst) begin
for (i=0;i<8;i=i+1)
mem[i]<=0;
end
else begin
if (wr_enb) begin
mem[wr_address]<=data_in;
end
else begin
data_out<=mem[rd_address];
end
end
end
endmodule
