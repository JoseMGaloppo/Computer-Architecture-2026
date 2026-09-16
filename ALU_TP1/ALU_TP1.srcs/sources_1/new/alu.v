// =====================================================================
// alu.v
// ALU parametrizable (combinacional puro)
// Trabajo Practico N1
// =====================================================================

module alu #(
    parameter WIDTH = 8
) (
    input  wire [WIDTH-1:0] A,
    input  wire [WIDTH-1:0] B,
    input  wire [5:0]       ALUop,
    output reg  [WIDTH-1:0] Result,
    output wire              Zero      // bandera auxiliar: Result == 0
);

    localparam ADD = 6'b100000;
    localparam SUB = 6'b100010;
    localparam AND = 6'b100100;
    localparam OR  = 6'b100101;
    localparam XOR = 6'b100110;
    localparam SRA = 6'b000011;
    localparam SRL = 6'b000010;
    localparam NOR = 6'b100111;

    wire signed [WIDTH-1:0] As = A;

    always @(*) begin
        case (ALUop)
            ADD:     Result = A + B;
            SUB:     Result = A - B;
            AND:     Result = A & B;
            OR:      Result = A | B;
            XOR:     Result = A ^ B;
            SRA:     Result = As >>> B;   // shift aritmetico a derecha (con signo)
            SRL:     Result = A  >>  B;   // shift logico a derecha
            NOR:     Result = ~(A | B);
            default: Result = {WIDTH{1'b0}};
        endcase
    end

    assign Zero = (Result == {WIDTH{1'b0}});

endmodule