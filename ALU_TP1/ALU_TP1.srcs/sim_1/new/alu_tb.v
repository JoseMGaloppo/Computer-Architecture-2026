// =====================================================================
// alu_tb.v
// Testbench automatico para ALU parametrizable
// Trabajo Practico N1
// =====================================================================

`timescale 1ns/1ps

module alu_tb;

    // -----------------------------------------------------------------
    // Parametros del testbench
    // -----------------------------------------------------------------

    parameter WIDTH = 8;

    // -----------------------------------------------------------------
    // Codigos de operacion
    // Deben coincidir con los de alu.v
    // -----------------------------------------------------------------

    localparam ADD = 6'b100000;
    localparam SUB = 6'b100010;
    localparam AND = 6'b100100;
    localparam OR  = 6'b100101;
    localparam XOR = 6'b100110;
    localparam SRA = 6'b000011;
    localparam SRL = 6'b000010;
    localparam NOR = 6'b100111;

    // -----------------------------------------------------------------
    // Señales conectadas al DUT
    // -----------------------------------------------------------------

    reg  [WIDTH-1:0] A;
    reg  [WIDTH-1:0] B;
    reg  [5:0]       ALUop;

    wire [WIDTH-1:0] Result;
    wire             Zero;

    // -----------------------------------------------------------------
    // Variables para el testbench
    // -----------------------------------------------------------------

    reg [WIDTH-1:0] Expected;
    reg             ExpectedZero;

    integer tests_total;
    integer tests_passed;
    integer tests_failed;

    integer i;

    // Para generar números aleatorios
    reg signed [WIDTH-1:0] SignedA;


    // -----------------------------------------------------------------
    // Instancia de la ALU
    // -----------------------------------------------------------------

    alu #(
        .WIDTH(WIDTH)
    ) dut (
        .A(A),
        .B(B),
        .ALUop(ALUop),
        .Result(Result),
        .Zero(Zero)
    );


    // =================================================================
    // TASK: ejecutar un test
    // =================================================================
    //
    // Recibe:
    //   A
    //   B
    //   operacion
    //   resultado esperado
    //
    // Luego compara automaticamente contra la salida de la ALU.
    // =================================================================

    task check_result;
        input [WIDTH-1:0] test_A;
        input [WIDTH-1:0] test_B;
        input [5:0]       test_op;
        input [WIDTH-1:0] expected_result;

        reg expected_zero;

        begin

            A    = test_A;
            B    = test_B;
            ALUop = test_op;

            // Esperamos un poco para que la logica combinacional
            // propague el resultado.
            #1;

            expected_zero = (expected_result == {WIDTH{1'b0}});

            tests_total = tests_total + 1;

            if ((Result === expected_result) &&
                (Zero === expected_zero)) begin

                tests_passed = tests_passed + 1;

                $display(
                    "[PASS] A=%h B=%h OP=%b -> Result=%h Zero=%b",
                    A, B, ALUop, Result, Zero
                );

            end else begin

                tests_failed = tests_failed + 1;

                $display(
                    "[FAIL] A=%h B=%h OP=%b",
                    A, B, ALUop
                );

                $display(
                    "       Expected: Result=%h Zero=%b",
                    expected_result, expected_zero
                );

                $display(
                    "       Obtained: Result=%h Zero=%b",
                    Result, Zero
                );

            end

        end
    endtask


    // =================================================================
    // TESTS
    // =================================================================

    initial begin

        // -------------------------------------------------------------
        // Inicializacion
        // -------------------------------------------------------------

        A = 0;
        B = 0;
        ALUop = 0;

        Expected = 0;
        ExpectedZero = 0;

        tests_total  = 0;
        tests_passed = 0;
        tests_failed = 0;

        $display("");
        $display("==============================================");
        $display("       INICIO TESTBENCH ALU");
        $display("       WIDTH = %0d", WIDTH);
        $display("==============================================");
        $display("");


        // =============================================================
        // 1. ADD
        // =============================================================

        $display("--- ADD ---");

        check_result(
            8'd10,
            8'd5,
            ADD,
            8'd15
        );

        check_result(
            8'd0,
            8'd0,
            ADD,
            8'd0
        );

        check_result(
            8'd100,
            8'd27,
            ADD,
            8'd127
        );


        // =============================================================
        // 2. SUB
        // =============================================================

        $display("");
        $display("--- SUB ---");

        check_result(
            8'd10,
            8'd5,
            SUB,
            8'd5
        );

        check_result(
            8'd5,
            8'd10,
            SUB,
            8'hFB       // -5 en complemento a dos
        );

        check_result(
            8'd10,
            8'd10,
            SUB,
            8'd0
        );


        // =============================================================
        // 3. AND
        // =============================================================

        $display("");
        $display("--- AND ---");

        check_result(
            8'b10101010,
            8'b11001100,
            AND,
            8'b10001000
        );

        check_result(
            8'hFF,
            8'h00,
            AND,
            8'h00
        );


        // =============================================================
        // 4. OR
        // =============================================================

        $display("");
        $display("--- OR ---");

        check_result(
            8'b10101010,
            8'b11001100,
            OR,
            8'b11101110
        );

        check_result(
            8'h00,
            8'h00,
            OR,
            8'h00
        );


        // =============================================================
        // 5. XOR
        // =============================================================

        $display("");
        $display("--- XOR ---");

        check_result(
            8'b10101010,
            8'b11001100,
            XOR,
            8'b01100110
        );

        check_result(
            8'hFF,
            8'hFF,
            XOR,
            8'h00
        );


        // =============================================================
        // 6. NOR
        // =============================================================

        $display("");
        $display("--- NOR ---");

        check_result(
            8'b10101010,
            8'b11001100,
            NOR,
            8'b00010001
        );

        check_result(
            8'h00,
            8'h00,
            NOR,
            8'hFF
        );


        // =============================================================
        // 7. SRL - Shift Right Logical
        // =============================================================

        $display("");
        $display("--- SRL ---");

        check_result(
            8'b10000000,
            8'd1,
            SRL,
            8'b01000000
        );

        check_result(
            8'b10000000,
            8'd2,
            SRL,
            8'b00100000
        );

        check_result(
            8'hFF,
            8'd4,
            SRL,
            8'h0F
        );


        // =============================================================
        // 8. SRA - Shift Right Arithmetic
        // =============================================================

        $display("");
        $display("--- SRA ---");

        // 10000000 = -128
        // -128 >>> 1 = -64 = 11000000

        check_result(
            8'b10000000,
            8'd1,
            SRA,
            8'b11000000
        );

        // 11110000 = -16
        // -16 >>> 2 = -4 = 11111100

        check_result(
            8'b11110000,
            8'd2,
            SRA,
            8'b11111100
        );

        // Numero positivo: SRA y SRL deben dar lo mismo

        check_result(
            8'b01000000,
            8'd2,
            SRA,
            8'b00010000
        );


        // =============================================================
        // 9. Casos limite
        // =============================================================

        $display("");
        $display("--- CASOS LIMITE ---");

        check_result(
            8'hFF,
            8'h01,
            ADD,
            8'h00
        );

        check_result(
            8'h00,
            8'h01,
            SUB,
            8'hFF
        );

        check_result(
            8'hFF,
            8'hFF,
            ADD,
            8'hFE
        );

        check_result(
            8'hFF,
            8'hFF,
            AND,
            8'hFF
        );

        check_result(
            8'hFF,
            8'hFF,
            OR,
            8'hFF
        );

        check_result(
            8'hFF,
            8'hFF,
            XOR,
            8'h00
        );


        // =============================================================
        // 10. Operacion invalida
        // =============================================================

        $display("");
        $display("--- OPERACION INVALIDA ---");

        check_result(
            8'hAA,
            8'h55,
            6'b111111,
            8'h00
        );


        // =============================================================
        // 11. PRUEBAS ALEATORIAS
        // =============================================================

        $display("");
        $display("--- PRUEBAS ALEATORIAS ---");

        for (i = 0; i < 100; i = i + 1) begin

            A = $random;
            B = $random;
        
            case ($urandom_range(0, 7))
        
                0: begin
                    ALUop = ADD;
                    Expected = A + B;
                end
        
                1: begin
                    ALUop = SUB;
                    Expected = A - B;
                end
        
                2: begin
                    ALUop = AND;
                    Expected = A & B;
                end
        
                3: begin
                    ALUop = OR;
                    Expected = A | B;
                end
        
                4: begin
                    ALUop = XOR;
                    Expected = A ^ B;
                end
        
                5: begin
                    ALUop = NOR;
                    Expected = ~(A | B);
                end
        
                6: begin
                    ALUop = SRL;
                    B = $urandom_range(0, WIDTH-1);
                    Expected = A >> B;
                end
        
                7: begin
                    ALUop = SRA;
                    B = $urandom_range(0, WIDTH-1);
        
                    SignedA = A;
                    Expected = SignedA >>> B;
                end
        
            endcase
        
            #1;
        
            ExpectedZero = (Expected == {WIDTH{1'b0}});
        
            tests_total = tests_total + 1;
        
            if ((Result === Expected) &&
                (Zero === ExpectedZero)) begin
        
                tests_passed = tests_passed + 1;
        
            end else begin
        
                tests_failed = tests_failed + 1;
        
                $display(
                    "[FAIL RANDOM] A=%h B=%h OP=%b Expected=%h Obtained=%h",
                    A, B, ALUop, Expected, Result
                );
        
            end
        
        end
        
        // =============================================================
        // RESULTADO FINAL
        // =============================================================

        $display("");
        $display("==============================================");
        $display("             RESULTADO FINAL");
        $display("==============================================");

        $display("Tests totales : %0d", tests_total);
        $display("Tests PASS    : %0d", tests_passed);
        $display("Tests FAIL    : %0d", tests_failed);

        $display("");

        if (tests_failed == 0) begin
            $display("**************************************");
            $display("         TODOS LOS TESTS PASS");
            $display("**************************************");
        end else begin
            $display("**************************************");
            $display("       HAY TESTS QUE FALLARON");
            $display("**************************************");
        end

        $display("");

        $finish;

    end

endmodule