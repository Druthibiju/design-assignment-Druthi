module srff(input s,r,rst,clk,output reg q,qb );
always@(posedge clk)
begin
if(rst)
begin
q<=1'b0;
qb<=1'b1;
end
else if(s==0 && r==0)
begin
q<=q;
qb<=qb;
end
else if(s==0 && r==1)
begin
q<=1'b0;
qb<=1'b1;
end
else if(s==1 && r==0)
begin
q<=1'b1;
qb<=1'b0;
end
else if(s==1&& r==1)
begin
q<='bx;
qb<='bx;
end
end
endmodule

