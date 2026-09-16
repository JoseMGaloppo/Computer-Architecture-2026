// =====================================================================
// basys3_alu_top.v
// Top level para la placa Basys3.
//
// Interfaz fisica (WIDTH = 8):
//   data_sw[7:0] -> bus de datos COMPARTIDO para A, B y la operacion.
//                   Su significado depende de que boton se presione:
//   btnL         -> carga data_sw[7:0] en el registro A
//   btnR         -> carga data_sw[7:0] en el registro B
//   btnU         -> carga data_sw[5:0] en el registro de operacion (ALUop)
//   btnC         -> reset (limpia A, B y operacion)
//
// Salidas:
//   led[7:0]  -> resultado de la ALU (Result)
//   led_zero  -> bandera Zero
//
// Flujo tipico de uso en la placa:
//   1) Poner en data_sw el valor de A, presionar btnL.
//   2) Poner en data_sw el valor de B, presionar btnR.
//   3) Poner en data_sw[5:0] el codigo de operacion (tabla del TP),
//      presionar btnU.
//   4) El resultado se ve inmediatamente en los LEDs (la ALU es
//      combinacional, no hace falta ningun boton de "calcular").
// =====================================================================

module basys3_alu_top (
    input  wire       clk,       // 100 MHz, pin W5
    input  wire       btnC,      // reset
    input  wire       btnU,      // cargar operacion (ALUop)
    input  wire       btnL,      // cargar A
    input  wire       btnR,      // cargar B
    input  wire [7:0] data_sw,   // bus de datos compartido

    output wire [7:0] led,       // resultado
    output wire        led_zero  // bandera Zero
);

    localparam WIDTH = 8;

    // -------------------------------------------------------------
    // Antirrebote de botones (los 4 que se usan)
    // -------------------------------------------------------------
    wire rst_pulse, load_a_pulse, load_b_pulse, load_control_pulse;

    debounce db_rst     (.clk(clk), .btn_in(btnC), .btn_pulse(rst_pulse));
    debounce db_load_a  (.clk(clk), .btn_in(btnL), .btn_pulse(load_a_pulse));
    debounce db_load_b  (.clk(clk), .btn_in(btnR), .btn_pulse(load_b_pulse));
    debounce db_load_op (.clk(clk), .btn_in(btnU), .btn_pulse(load_control_pulse));

    // -------------------------------------------------------------
    // Registros de entrada A, B y operacion (se cargan desde data_sw)
    // -------------------------------------------------------------
    reg [WIDTH-1:0] regA, regB;
    reg [5:0]       regControl;

    always @(posedge clk) begin
        if (rst_pulse) begin
            regA       <= {WIDTH{1'b0}};
            regB       <= {WIDTH{1'b0}};
            regControl <= 6'b0;
        end else begin
            if (load_a_pulse)       regA       <= data_sw;
            if (load_b_pulse)       regB       <= data_sw;
            if (load_control_pulse) regControl <= data_sw[5:0];
        end
    end

    // -------------------------------------------------------------
    // Instancia de la ALU (misma que se valido en el testbench)
    // -------------------------------------------------------------
    wire [WIDTH-1:0] result;
    wire zero_flag;

    alu #(.WIDTH(WIDTH)) ALU_INST (
        .A      (regA),
        .B      (regB),
        .ALUop  (regControl),
        .Result (result),
        .Zero   (zero_flag)
    );

    assign led      = result;
    assign led_zero = zero_flag;

endmodule