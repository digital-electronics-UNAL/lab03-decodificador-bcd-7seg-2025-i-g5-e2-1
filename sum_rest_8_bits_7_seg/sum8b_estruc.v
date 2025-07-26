module sum8b_estruc (
    input  [7:0] A, B,
    input  Ci0,          // acarreo de entrada inicial
    output Cout,         // acarreo final
    output [7:0] S
);

    wire Ci1, Ci2, Ci3, Ci4, Ci5, Ci6, Ci7;  // acarreos intermedios
	 
	 

    // Instanciamos 8 sumadores de 1 bit
    sum1b_estruc bit0 (.A(A[0]), .B(B[0]), .Ci(Ci0), .Cout(Ci1), .S(S[0]));
    sum1b_estruc bit1 (.A(A[1]), .B(B[1]), .Ci(Ci1), .Cout(Ci2), .S(S[1]));
    sum1b_estruc bit2 (.A(A[2]), .B(B[2]), .Ci(Ci2), .Cout(Ci3), .S(S[2]));
    sum1b_estruc bit3 (.A(A[3]), .B(B[3]), .Ci(Ci3), .Cout(Ci4), .S(S[3]));
	 sum1b_estruc bit4 (.A(A[4]), .B(B[4]), .Ci(Ci4), .Cout(Ci5), .S(S[4]));
    sum1b_estruc bit5 (.A(A[5]), .B(B[5]), .Ci(Ci5), .Cout(Ci6), .S(S[5]));
    sum1b_estruc bit6 (.A(A[6]), .B(B[6]), .Ci(Ci6), .Cout(Ci7), .S(S[6]));
    sum1b_estruc bit7 (.A(A[7]), .B(B[7]), .Ci(Ci7), .Cout(Cout), .S(S[7]));
	 
	 
	 
	 
	 

endmodule
