module block_generator_tb(

    );
    reg clk_tb,arst_tb,wr_enb_tb;
    reg [2:0] wr_address_tb,rd_address_tb;
    reg [7:0]data_in_tb;
    wire [7:0] data_out_tb;
    block_memory_generator dut (clk_tb,arst_tb,wr_enb_tb,wr_address_tb,rd_address_tb,data_in_tb,data_out_tb);
    initial begin
    {clk_tb,arst_tb,wr_enb_tb,wr_address_tb,rd_address_tb,data_in_tb}=0;
    end
    always #5 clk_tb=~clk_tb;
    initial begin
    arst_tb=1'b0;
    #10
    arst_tb=1'b1;
    wr_enb_tb=1'b1;
    wr_address_tb=3'b000;
    data_in_tb=8'h5b;#10
    wr_address_tb=3'b001;
    data_in_tb=8'h4f;#10
    wr_address_tb=3'b010;
    data_in_tb=8'h12;#10
    wr_address_tb=3'b011;
    data_in_tb=8'h8a;#10
    wr_address_tb=3'b100;
    data_in_tb=8'h15;#10
    wr_address_tb=3'b101;
    data_in_tb=8'h1c;#10
    wr_address_tb=3'b110;
    data_in_tb=8'h70;#10
    wr_address_tb=3'b111;
    data_in_tb=8'h6d;#10;
    wr_enb_tb=0;#10;
    rd_address_tb=3'b000;#10;
    rd_address_tb=3'b001;#10;
    rd_address_tb=3'b010;#10;
    rd_address_tb=3'b011;#10;
    rd_address_tb=3'b100;#10;
    rd_address_tb=3'b101;#10;
    rd_address_tb=3'b110;#10;
    rd_address_tb=3'b111;#10;
    $finish;
    
    
    end
endmodule
