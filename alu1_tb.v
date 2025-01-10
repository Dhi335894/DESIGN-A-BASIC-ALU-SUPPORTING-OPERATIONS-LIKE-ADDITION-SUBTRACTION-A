// Testbench for ALU
module ALU_tb();
    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] opcode;
    wire [3:0] result;
    wire carry_out;

    ALU uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
        .carry_out(carry_out)
    );

    initial begin
        $monitor($time, " A = %b, B = %b, opcode = %b, result = %b, carry_out = %b", A, B, opcode, result, carry_out);

        // Test Addition
        A = 4'b0011; B = 4'b0001; opcode = 3'b000; #10;
        // Test Subtraction
        A = 4'b0100; B = 4'b0010; opcode = 3'b001; #10;
        // Test AND
        A = 4'b1100; B = 4'b1010; opcode = 3'b010; #10;
        // Test OR
        A = 4'b1100; B = 4'b1010; opcode = 3'b011; #10;
        // Test NOT
        A = 4'b1100; B = 4'bxxxx; opcode = 3'b100; #10;
        // Test Default Case
        A = 4'b0000; B = 4'b0000; opcode = 3'b111; #10;

        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);
    end

endmodule