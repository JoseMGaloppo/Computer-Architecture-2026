`timescale 1ns / 1ps

module tb_uart_alu_system;

    // =========================================================================
    // 1. Parámetros de Simulación
    // =========================================================================
    localparam CLK_FREQ  = 100000000; // 50 MHz
    localparam BAUD_RATE = 9600;     // Baud rate elevado para simulación rápida
    localparam DBIT      = 8;
    
    // Periodo del reloj en nanosegundos: 1 / 50MHz = 20 ns
    localparam CLK_PERIOD = 20; 
    
    
    localparam BIT_PERIOD = 1000000000 / BAUD_RATE;
    // =========================================================================
    // 2. Señales del Testbench
    // =========================================================================
    reg  clk;
    reg  reset;
    reg  rx_pin;
    wire tx_pin;
    
    // Variables para almacenar los resultados recibidos
    reg [DBIT-1:0] rx_result;

    // =========================================================================
    // 3. Instanciación del Device Under Test (DUT)
    // =========================================================================
    uart_alu_system_top #(
        .CLK_FREQ(CLK_FREQ),
        .BAUD_RATE(BAUD_RATE),
        .DBIT(DBIT)
    ) dut (
        .clk(clk),
        .reset(reset),
        .rx_pin(rx_pin),
        .tx_pin(tx_pin)
    );

    // =========================================================================
    // 4. Generación de Reloj
    // =========================================================================
    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk; // Toggle cada 10 ns
    end

    // =========================================================================
    // 5. Tareas (Tasks) de Modelado Funcional (BFM - Bus Functional Models)
    // =========================================================================

    // Tarea para emular una PC enviando un byte a la FPGA
    task send_byte(input [7:0] data);
        integer i;
        begin
            // Bit de START
            rx_pin = 1'b0;
            #(BIT_PERIOD);
            
            // 8 Bits de Datos (LSB first)
            for (i = 0; i < 8; i = i + 1) begin
                rx_pin = data[i];
                #(BIT_PERIOD);
            end
            
            // Bit de STOP
            rx_pin = 1'b1;
            #(BIT_PERIOD);
            
            // Pequeña pausa entre bytes (simulando delay de la terminal)
            #(BIT_PERIOD * 2);
        end
    endtask

    // Tarea para emular a la PC recibiendo el resultado de la FPGA
    task receive_byte(output [7:0] data);
        integer i;
        begin
            // Esperamos el flanco de bajada del bit de START
            wait(tx_pin == 1'b0);
            
            // Nos posicionamos en el centro del bit de START
            #(BIT_PERIOD / 2);
            
            if (tx_pin == 1'b0) begin
                // Saltamos al centro del bit 0
                #(BIT_PERIOD);
                
                // Leemos los 8 bits
                for (i = 0; i < 8; i = i + 1) begin
                    data[i] = tx_pin;
                    #(BIT_PERIOD);
                end
                
                // Esperamos el bit de STOP
                #(BIT_PERIOD);
            end
        end
    endtask

    // =========================================================================
    // 6. Vector de Prueba (Estímulos)
    // =========================================================================
    initial begin
        // Inicialización de señales
        reset  = 1'b1;
        rx_pin = 1'b1; // Línea serie en reposo (ALTO)
        
        // Mantenemos el reset por unos cuantos ciclos
        #(CLK_PERIOD * 10);
        reset = 1'b0;
        #(CLK_PERIOD * 10);

        $display("--- INICIANDO SIMULACIÓN UART ALU ---");

        // ---------------------------------------------------------------------
        // PRUEBA 1: Suma (ADD) -> 15 + 25 = 40 (0x28)
        // ---------------------------------------------------------------------
        $display("Prueba 1: ADD (15 + 25)");
        send_byte(8'd15);        // Operando A
        send_byte(8'd25);        // Operando B
        send_byte(8'h20);        // Opcode ADD (6'b100000 = 0x20)
        
        // Esperamos la respuesta del DUT
        receive_byte(rx_result);
        
        if (rx_result == 8'd40)
            $display("[EXITO] Resultado recibido: %d (0x%h)", rx_result, rx_result);
        else
            $display("[ERROR] Se esperaba 40, se recibió: %d", rx_result);

        #(BIT_PERIOD * 5); // Pausa entre pruebas

        // ---------------------------------------------------------------------
        // PRUEBA 2: XOR Bit a bit -> 0xAA ^ 0x55 = 0xFF
        // ---------------------------------------------------------------------
        $display("Prueba 2: XOR (0xAA ^ 0x55)");
        send_byte(8'hAA);        // Operando A: 10101010
        send_byte(8'h55);        // Operando B: 01010101
        send_byte(8'h26);        // Opcode XOR (6'b100110 = 0x26)
        
        receive_byte(rx_result);
        
        if (rx_result == 8'hFF)
            $display("[EXITO] Resultado recibido: 0x%h", rx_result);
        else
            $display("[ERROR] Se esperaba FF, se recibió: 0x%h", rx_result);

        // ---------------------------------------------------------------------
        // Fin de la simulación
        // ---------------------------------------------------------------------
        #(BIT_PERIOD * 10);
        $display("--- SIMULACIÓN FINALIZADA ---");
        $finish;
    end

endmodule