// ALU Design in Verilog
module ALU (
    input [3:0] A,
    input [3:0] B,
    input [2:0] opcode,
    output reg [3:0] result,
    output reg carry_out
);

    always @(*) begin
        carry_out = 0;
        case (opcode)
            3'b000: result = A + B;              // Addition
            3'b001: {carry_out, result} = A - B; // Subtraction
            3'b010: result = A & B;             // AND
            3'b011: result = A | B;             // OR
            3'b100: result = ~A;                // NOT (B is ignored)
            default: result = 4'b0000;          // Default case
        endcase
    end

endmodule
