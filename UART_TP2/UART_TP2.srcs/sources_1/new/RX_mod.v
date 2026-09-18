module uart_rx
#(
    parameter DBIT = 8 // Número de bits de datos de la trama UART
)
(
    input  wire clk,
    input  wire reset,
    input  wire rx_in,         // Entrada serial
    input  wire s_tick,        // Pulso de habilitación (16x Baud Rate)
    output reg  [DBIT-1:0] rx_data_out, // Palabra de datos decodificada en paralelo
    output reg  rx_done_tick   // Bandera (pulso de 1 ciclo) de dato completo
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
    reg [3:0] s_reg, s_next;       // Contador de ticks para muestreo (0 a 15)
    reg [2:0] n_reg, n_next;       // Contador de bits recibidos (0 a 7)
    reg [DBIT-1:0] b_reg, b_next;  // Shift register de datos

    // -------------------------------------------------------------------------
    // 1. Lógica Secuencial: Actualización sincrónica
    // -------------------------------------------------------------------------
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state_reg <= IDLE;
            s_reg     <= 0;
            n_reg     <= 0;
            b_reg     <= 0;
        end else begin
            state_reg <= state_next;
            s_reg     <= s_next;
            n_reg     <= n_next;
            b_reg     <= b_next;
        end
    end

    // -------------------------------------------------------------------------
    // 2. Lógica Combinacional: Transición de estados (FSM) y Datapath
    // -------------------------------------------------------------------------
    always @(*) begin
        // Valores por defecto para evitar inferencia de latches
        state_next   = state_reg;
        s_next       = s_reg;
        n_next       = n_reg;
        b_next       = b_reg;
        rx_done_tick = 1'b0;

        case (state_reg)
            IDLE: begin
                if (~rx_in) begin // Se detecta el flanco de bajada (Inicio del bit Start)
                    state_next = START;
                    s_next     = 0;
                end
            end

            START: begin
                if (s_tick) begin
                    if (s_reg == 7) begin 
                        // Tras 8 ticks, estamos en el CENTRO del bit de Start.
                        state_next = DATA;
                        s_next     = 0;
                        n_next     = 0;
                    end else begin
                        s_next = s_reg + 1;
                    end
                end
            end

            DATA: begin
                if (s_tick) begin
                    if (s_reg == 15) begin 
                        // Tras 16 ticks, estamos en el CENTRO de un bit de datos.
                        s_next = 0;
                        
                        // Shift Register: Entra el bit muestreado, desplazando a la derecha
                        // (El estándar UART transmite LSB primero)
                        b_next = {rx_in, b_reg[DBIT-1:1]};
                        
                        if (n_reg == (DBIT-1)) begin // Si ya leímos todos los bits
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
                if (s_tick) begin
                    if (s_reg == 15) begin 
                        // Tras 16 ticks, estamos en el CENTRO del bit de Stop
                        state_next   = IDLE;
                        rx_done_tick = 1'b1; // Emitimos el pulso de validación
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
        rx_data_out = b_reg;
    end

endmodule