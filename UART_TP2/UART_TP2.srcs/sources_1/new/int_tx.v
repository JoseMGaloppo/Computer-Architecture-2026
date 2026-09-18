`timescale 1ns / 1ps

module alu_tx_interface
#(
    parameter DBIT = 8
)
(
    input  wire clk,
    input  wire reset,
    
    // Interfaz con la ALU y la etapa anterior
    input  wire [DBIT-1:0] alu_result,      // Salida combinacional de la ALU
    input  wire            calc_done_tick,  // Pulso que indica que el resultado es válido
    
    // Interfaz con UART TX
    output wire [DBIT-1:0] tx_data,         // Dato aislado y estable para el TX
    output wire            tx_start_tick    // Pulso para iniciar la transmisión
);

    // -------------------------------------------------------------------------
    // Declaración de Registros (Shadow Registers)
    // -------------------------------------------------------------------------
    reg [DBIT-1:0] tx_data_reg, tx_data_next;
    reg            tx_start_reg, tx_start_next;

    // -------------------------------------------------------------------------
    // 1. Lógica Secuencial
    // -------------------------------------------------------------------------
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            tx_data_reg  <= 0;
            tx_start_reg <= 1'b0;
        end else begin
            tx_data_reg  <= tx_data_next;
            tx_start_reg <= tx_start_next;
        end
    end

    // -------------------------------------------------------------------------
    // 2. Lógica Combinacional (Snapshot)
    // -------------------------------------------------------------------------
    always @(*) begin
        // Mantenemos el dato latcheado por defecto
        tx_data_next  = tx_data_reg;
        
        // El pulso de inicio por defecto es 0 (para que dure solo 1 ciclo)
        tx_start_next = 1'b0; 

        if (calc_done_tick) begin
            // Tomamos la "fotografía" del resultado de la ALU
            tx_data_next  = alu_result;
            // Generamos el pulso para arrancar el TX
            tx_start_next = 1'b1;
        end
    end

    // -------------------------------------------------------------------------
    // 3. Lógica de Salida
    // -------------------------------------------------------------------------
    assign tx_data       = tx_data_reg;
    assign tx_start_tick = tx_start_reg;

endmodule