module sum_rest8b_estruc (
    input [7:0]A, B,
    input  Ci0,
    output Cout,
    output [7:0]S
);

    wire b_nb0, b_nb1, b_nb2, b_nb3, b_nb4, b_nb5, b_nb6, b_nb7;
	 
	 wire b_notb0, b_notb1, b_notb2, b_notb3, b_notb4, b_notb5, b_notb6, b_notb7;
	  
	 wire [7:0] B_nb;
	 
	 not(b_notb0, B[0]);
    not(b_notb1, B[1]);
    not(b_notb2, B[2]);
    not(b_notb3, B[3]);
	 not(b_notb4, B[4]);
	 not(b_notb5, B[5]);
	 not(b_notb6, B[6]);
	 not(b_notb7, B[7]);

    xor(b_nb0, b_notb0, Ci0);
    xor(b_nb1, b_notb1, Ci0);
    xor(b_nb2, b_notb2, Ci0);
    xor(b_nb3, b_notb3, Ci0);
	 xor(b_nb4, b_notb4, Ci0);
    xor(b_nb5, b_notb5, Ci0);
    xor(b_nb6, b_notb6, Ci0);
    xor(b_nb7, b_notb7, Ci0);
	 
	 assign B_nb = {b_nb7, b_nb6, b_nb5, b_nb4, b_nb3, b_nb2, b_nb1, b_nb0};

    sum8b_estruc sum8b_inst(
        .A(A), .B(B_nb), .Ci0(Ci0),
        .Cout(Cout),
        .S(S)
    );

endmodule
