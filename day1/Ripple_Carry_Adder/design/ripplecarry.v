module ripplecarry(input [3:0]A,[3:0]B,input cin,output [3:0]S,output cout);
wire c2,c3,c4;
fulladder FA1(A[0],B[0],cin,S[0],c2);
fulladder FA2(A[1],B[1],c2,S[1],c3);
fulladder FA3(A[2],B[2],c3,S[2],c4);
fulladder FA4(A[3],B[3],c4,S[3],cout);
endmodule

