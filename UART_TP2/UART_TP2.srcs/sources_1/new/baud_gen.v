`timescale 1ns / 1ps

module baud_rate_generator
#(
    // Parámetros por defecto: clk = 50 MHz, baud = 19200 bps
    // M = 50,000,000 / (16 * 19200) = 162.76 -> Redondeamos a 163
    // N = ceil(log2(163)) = 8 bits
    parameter N = 8,
    parameter M = 651
)
(
    input  wire clk,     // Reloj maestro del sistema de la FPGA
    input  wire reset,   // Reset asincrónico (activo en alto)
    output wire s_tick   // Pulso de habilitación a 16x de la tasa de baudios
);

    // Declaración de los registros de estado (presente y futuro)
    reg [N-1:0] r_reg;
    wire [N-1:0] r_next;

    // 1. Lógica Secuencial: Actualización del registro en flanco de subida
    always @(posedge clk or posedge reset) begin
        if (reset)
            r_reg <= 0;
        else
            r_reg <= r_next;
    end

    // 2. Lógica Combinacional: Cálculo del estado siguiente
    // Se reinicia a 0 al alcanzar el límite de conteo (M-1)
    assign r_next = (r_reg == (M - 1)) ? 0 : r_reg + 1;

    // 3. Lógica de Salida
    // Genera un '1' lógico combinacional de exactamente 1 ciclo de reloj de duración
    assign s_tick = (r_reg == (M - 1));

endmodule