interface fifo_if;
    logic clk;
    logic rst;
    logic wr_enb;
    logic rd_enb;
    logic [7:0] data_in;
    logic full;
    logic empty;
    logic [7:0] data_out;
endinterface
module fifo_tb();
fifo_if fif();
logic  clk_tb;
logic  rst_tb;
logic  wr_enb_tb;
logic  rd_enb_tb;
logic [7:0] data_in_tb;
logic full_tb;
logic empty_tb;
logic [7:0] data_out_tb;
assign fif.clk = clk_tb;
assign fif.rst = rst_tb;
assign fif.wr_enb  = wr_enb_tb;
assign fif.rd_enb  = rd_enb_tb;
assign fif.data_in = data_in_tb;
assign full_tb = fif.full;
assign empty_tb = fif.empty;
assign data_out_tb = fif.data_out;
fifo dut(.clk(fif.clk),.rst(fif.rst),.wr_enb(fif.wr_enb),.rd_enb(fif.rd_enb),.data_in(fif.data_in),.full(fif.full),.empty(fif.empty),.data_out(fif.data_out));
initial begin
    clk_tb = 0;
    forever #5 clk_tb = ~clk_tb;
end
initial begin
    rst_tb  = 1;
    wr_enb_tb  = 0;
    rd_enb_tb  = 0;
    data_in_tb = 0;
    #20;
    rst_tb = 0;
    wr_enb_tb  = 1;
    data_in_tb = 8'h11;
    #10;
    data_in_tb = 8'h22;
    #10;
    data_in_tb = 8'h33;
    #10;
    data_in_tb = 8'h44;
    #10;
    wr_enb_tb = 0;
    #20;
    rd_enb_tb = 1;
    #40;
    rd_enb_tb = 0;
    #20;
    $finish;
end
initial begin
    $monitor("Time=%0t rst=%b wr=%b rd=%b din=%h dout=%h full=%b empty=%b",$time,rst_tb,wr_enb_tb,rd_enb_tb,data_in_tb,data_out_tb,full_tb,empty_tb);
end
endmodule
