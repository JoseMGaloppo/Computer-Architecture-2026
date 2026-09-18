`timescale 1ns / 1ps

module uart_alu_system_top
#(
    parameter CLK_FREQ = 100000000, // Frecuencia del reloj de la FPGA
    parameter BAUD_RATE = 9600,   // Velocidad de transmisión
    parameter DBIT = 8             // Ancho de palabra de datos (A, B y Result)
)
(
    input  wire clk,         // Reloj maestro del sistema
    input  wire reset,       // Reset asincrónico (activo en alto)
    input  wire rx_pin,      // Pin de entrada serial (RX)
    output wire tx_pin       // Pin de salida serial (TX)
);

    // =========================================================================
    // 1. Cálculo de Parámetros Dinámicos
    // =========================================================================
    localparam M_VAL = CLK_FREQ / (16 * BAUD_RATE);
    localparam N_VAL = $clog2(M_VAL);

    // =========================================================================
    // 2. Declaración de Cables de Interconexión (Buses Internos)
    // =========================================================================
    wire tick_16x;

    wire [DBIT-1:0] rx_data_wire;
    wire            rx_done_wire;

    wire [DBIT-1:0] alu_a_wire;
    wire [DBIT-1:0] alu_b_wire;
    wire [DBIT-1:0] alu_op_wire;   // Bus de 8 bits proveniente de la interfaz
    wire            calc_done_wire;

    wire [DBIT-1:0] alu_result_wire;

    wire [DBIT-1:0] tx_data_wire;
    wire            tx_start_wire;
    wire            tx_done_wire;

    // =========================================================================
    // 3. Instanciación de Módulos (Structural Modeling)
    // =========================================================================

    baud_rate_generator #(
        .N(N_VAL), 
        .M(M_VAL)
    ) baud_gen_inst (
        .clk(clk),
        .reset(reset),
        .s_tick(tick_16x)
    );

    uart_rx #(
        .DBIT(DBIT)
    ) rx_inst (
        .clk(clk),
        .reset(reset),
        .rx_in(rx_pin),
        .s_tick(tick_16x),
        .rx_data_out(rx_data_wire),
        .rx_done_tick(rx_done_wire)
    );

    rx_alu_interface #(
        .DBIT(DBIT)
    ) interface_rx_inst (
        .clk(clk),
        .reset(reset),
        .rx_data_in(rx_data_wire),
        .rx_done_tick(rx_done_wire),
        .alu_a(alu_a_wire),
        .alu_b(alu_b_wire),
        .alu_op(alu_op_wire),
        .calc_done_tick(calc_done_wire)
    );

    // Instanciación exacta de la ALU proporcionada
    alu #(
        .WIDTH(DBIT)
    ) alu_inst (
        .A(alu_a_wire),
        .B(alu_b_wire),
        .ALUop(alu_op_wire[5:0]), // Truncamiento explícito: 8 bits -> 6 bits
        .Result(alu_result_wire),
        .Zero()                   // Puerto no conectado (Open)
    );

    alu_tx_interface #(
        .DBIT(DBIT)
    ) interface_tx_inst (
        .clk(clk),
        .reset(reset),
        .alu_result(alu_result_wire),
        .calc_done_tick(calc_done_wire),
        .tx_data(tx_data_wire),
        .tx_start_tick(tx_start_wire)
    );

    uart_tx #(
        .DBIT(DBIT)
    ) tx_inst (
        .clk(clk),
        .reset(reset),
        .tx_start_tick(tx_start_wire),
        .s_tick(tick_16x),
        .tx_data_in(tx_data_wire),
        .tx_out(tx_pin),
        .tx_done_tick(tx_done_wire)
    );

endmodule