`timescale 1ns / 1ps

module rx_alu_interface
#(
    parameter DBIT = 8 // Ancho de palabra de los datos recibidos
)
(
    input  wire clk,
    input  wire reset,
    
    // Interfaz con UART RX
    input  wire [DBIT-1:0] rx_data_in, // Dato paralelo que llega del RX
    input  wire            rx_done_tick, // Pulso que indica que rx_data_in es válido
    
    // Interfaz con ALU (Salidas a los operandos)
    output wire [DBIT-1:0] alu_a,
    output wire [DBIT-1:0] alu_b,
    output wire [DBIT-1:0] alu_op,
    
    // Interfaz con UART TX (Señal de control)
    output reg             calc_done_tick // Pulso de 1 ciclo indicando fin de carga
);

    // -------------------------------------------------------------------------
    // Declaración de Registros
    // -------------------------------------------------------------------------
    // Registros para retener los operandos de la ALU
    reg [DBIT-1:0] reg_a, reg_a_next;
    reg [DBIT-1:0] reg_b, reg_b_next;
    reg [DBIT-1:0] reg_op, reg_op_next;
    
    // Contador para el demultiplexor temporal (0 a 3)
    reg [1:0] count_reg, count_next;

    // -------------------------------------------------------------------------
    // 1. Lógica Secuencial
    // -------------------------------------------------------------------------
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            reg_a     <= 0;
            reg_b     <= 0;
            reg_op    <= 0;
            count_reg <= 2'b00;
        end else begin
            reg_a     <= reg_a_next;
            reg_b     <= reg_b_next;
            reg_op    <= reg_op_next;
            count_reg <= count_next;
        end
    end

    // -------------------------------------------------------------------------
    // 2. Lógica Combinacional (Ruteo y Control)
    // -------------------------------------------------------------------------
    always @(*) begin
        // Valores por defecto para mantener el estado (evitar latches)
        reg_a_next     = reg_a;
        reg_b_next     = reg_b;
        reg_op_next    = reg_op;
        count_next     = count_reg;
        calc_done_tick = 1'b0;

        // Si el contador llegó a 3, disparamos el flag y reiniciamos
        if (count_reg == 2'd3) begin
            calc_done_tick = 1'b1;
            count_next     = 2'd0;
        end 
        // Si el contador está entre 0 y 2, evaluamos las llegadas del RX
        else if (rx_done_tick) begin
            case (count_reg)
                2'd0: begin
                    reg_a_next = rx_data_in; // Primer byte -> Registro A
                    count_next = 2'd1;
                end
                2'd1: begin
                    reg_b_next = rx_data_in; // Segundo byte -> Registro B
                    count_next = 2'd2;
                end
                2'd2: begin
                    reg_op_next = rx_data_in; // Tercer byte -> Registro de Operación
                    count_next  = 2'd3;       // Avanza a estado 3 para generar el tick
                end
                default: count_next = 2'd0;
            endcase
        end
    end

    // -------------------------------------------------------------------------
    // 3. Salidas hacia la ALU
    // -------------------------------------------------------------------------
    assign alu_a  = reg_a;
    assign alu_b  = reg_b;
    assign alu_op = reg_op;

endmodule