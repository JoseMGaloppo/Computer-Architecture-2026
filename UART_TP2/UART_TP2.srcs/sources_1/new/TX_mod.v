`timescale 1ns / 1ps

module uart_tx
#(
    parameter DBIT = 8 // Número de bits de datos de la trama UART
)
(
    input  wire clk,
    input  wire reset,
    input  wire tx_start_tick,     // Pulso para iniciar la transmisión
    input  wire s_tick,            // Pulso de habilitación (16x Baud Rate)
    input  wire [DBIT-1:0] tx_data_in, // Palabra de datos paralela a transmitir
    output reg  tx_out,            // Salida serial
    output reg  tx_done_tick       // Bandera (pulso de 1 ciclo) de transmisión completa
);

    // -------------------------------------------------------------------------
    // Definición de Estados FMS con Codificación One-Hot
    // -------------------------------------------------------------------------
    localparam [3:0]
        IDLE  = 4'b0001,
        START = 4'b0010,
        DATA  = 4'b0100,
        STOP  = 4'b1000;

    // -------------------------------------------------------------------------
    // Declaración de Registros de Estado y Contadores
    // -------------------------------------------------------------------------
    reg [3:0] state_reg, state_next;
    reg [3:0] s_reg, s_next;       // Contador de ticks para duración del bit (0 a 15)
    reg [2:0] n_reg, n_next;       // Contador de bits transmitidos (0 a 7)
    reg [DBIT-1:0] b_reg, b_next;  // Shift register de datos a transmitir
    reg       tx_reg, tx_next;     // Registro para asegurar una salida serial libre de glitches

    // -------------------------------------------------------------------------
    // 1. Lógica Secuencial: Actualización sincrónica
    // -------------------------------------------------------------------------
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state_reg <= IDLE;
            s_reg     <= 0;
            n_reg     <= 0;
            b_reg     <= 0;
            tx_reg    <= 1'b1; // Línea en reposo (Idle) está en ALTO según RS-232
        end else begin
            state_reg <= state_next;
            s_reg     <= s_next;
            n_reg     <= n_next;
            b_reg     <= b_next;
            tx_reg    <= tx_next;
        end
    end

    // -------------------------------------------------------------------------
    // 2. Lógica Combinacional: Transición de estados y Datapath
    // -------------------------------------------------------------------------
    always @(*) begin
        // Valores por defecto para evitar inferencia de latches
        state_next   = state_reg;
        s_next       = s_reg;
        n_next       = n_reg;
        b_next       = b_reg;
        tx_next      = tx_reg;
        tx_done_tick = 1'b0;

        case (state_reg)
            IDLE: begin
                tx_next = 1'b1; // Aseguramos que la línea siga en reposo
                if (tx_start_tick) begin
                    state_next = START;
                    s_next     = 0;
                    b_next     = tx_data_in; // Capturamos el dato a enviar
                end
            end

            START: begin
                tx_next = 1'b0; // Bit de START (Flanco de bajada)
                if (s_tick) begin
                    if (s_reg == 15) begin 
                        // Tras 16 ticks, terminó el bit de Start
                        state_next = DATA;
                        s_next     = 0;
                        n_next     = 0;
                    end else begin
                        s_next = s_reg + 1;
                    end
                end
            end

            DATA: begin
                tx_next = b_reg[0]; // Transmitimos el bit menos significativo (LSB)
                if (s_tick) begin
                    if (s_reg == 15) begin 
                        // Tras 16 ticks, terminó este bit de datos
                        s_next = 0;
                        
                        // Shift Register: Desplazamos a la derecha
                        b_next = {1'b0, b_reg[DBIT-1:1]};
                        
                        if (n_reg == (DBIT-1)) begin // Si ya enviamos todos los bits
                            state_next = STOP;
                        end else begin
                            n_next = n_reg + 1;
                        end
                    end else begin
                        s_next = s_reg + 1;
                    end
                end
            end

            STOP: begin
                tx_next = 1'b1; // Bit de STOP (Flanco de subida)
                if (s_tick) begin
                    if (s_reg == 15) begin 
                        // Tras 16 ticks, terminó el bit de Stop
                        state_next   = IDLE;
                        tx_done_tick = 1'b1; // Emitimos el pulso de validación final
                    end else begin
                        s_next = s_reg + 1;
                    end
                end
            end

            default: state_next = IDLE;
        endcase
    end

    // -------------------------------------------------------------------------
    // 3. Lógica de Salida Continua
    // -------------------------------------------------------------------------
    always @(*) begin
        tx_out = tx_reg;
    end

endmodule