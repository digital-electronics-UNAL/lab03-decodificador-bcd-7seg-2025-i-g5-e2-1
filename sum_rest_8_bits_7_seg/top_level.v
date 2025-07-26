module top_level (
    input clk,
    input rst,
    input [7:0] A, B,
    input sel,           // 0 = suma, 1 = resta
    output [6:0] sseg,
    output [4:0] an,
    output led,
	 output [7:0] S,
	 output Cout
);

	wire [8:0] valor_abs;

    sum_rest8b_estruc alu (
        .A(A),
        .B(B),
        .Ci0(sel),
        .Cout(Cout),
        .S(S)
    );
	 
	 
	 wire S_notb0, S_notb1, S_notb2, S_notb3, S_notb4, S_notb5, S_notb6, S_notb7, S_notb8, C_not, sel_not;
	 wire S_xorb0, S_xorb1, S_xorb2, S_xorb3, S_xorb4, S_xorb5, S_xorb6, S_xorb7;
	 wire Co1, Co2, Co3, Co4, Co5, Co6, Co7;
	 
	 
	 wire r, k;
	 
	 wire [7:0]V;
	 
	 
	 
    
	 
	 not(S_notb0, S[0]);
    not(S_notb1, S[1]);
    not(S_notb2, S[2]);
    not(S_notb3, S[3]);
	 not(S_notb4, S[4]);
	 not(S_notb5, S[5]);
	 not(S_notb6, S[6]);
	 not(S_notb7, S[7]);
	 not(C_notb, Cout);
	 not(sel_not, sel);
	 
	 and(r ,sel_not , Cout); 
	 
	 
	 xor(S_xorb0, S_notb0, r);
	 xor(S_xorb1, S_notb1, r);
	 xor(S_xorb2, S_notb2, r);
	 xor(S_xorb3, S_notb3, r);
	 xor(S_xorb4, S_notb4, r);
	 xor(S_xorb5, S_notb5, r);
	 xor(S_xorb6, S_notb6, r);
	 xor(S_xorb7, S_notb7, r);
	 xor(S_xorb8, Cout, r);
	 
	 and(k, C_notb, sel);
	 
	 semisum1b_estruc bit0 (.A(S_xorb0), .B(r), .Cout(Co1), .S(V[0]));
	 semisum1b_estruc bit1 (.A(S_xorb1), .B(Co1), .Cout(Co2), .S(V[1]));
	 semisum1b_estruc bit2 (.A(S_xorb2), .B(Co2), .Cout(Co3), .S(V[2]));
	 semisum1b_estruc bit3 (.A(S_xorb3), .B(Co3), .Cout(Co4), .S(V[3]));
	 semisum1b_estruc bit4 (.A(S_xorb4), .B(Co4), .Cout(Co5), .S(V[4]));
	 semisum1b_estruc bit5 (.A(S_xorb5), .B(Co5), .Cout(Co6), .S(V[5]));
	 semisum1b_estruc bit6 (.A(S_xorb6), .B(Co6), .Cout(Co7), .S(V[6]));
	 semisum1b_estruc bit7 (.A(S_xorb7), .B(Co7), .S(V[7]));
	 	

    assign valor_abs ={k ,V[7], V[6], V[5], V[4], V[3], V[2], V[1], V[0]};

    display disp (
        .num(valor_abs),
        .clk(clk),
        .rst(rst),
        .an(an),
        .sseg(sseg),
        .led(led)
    );
endmodule

