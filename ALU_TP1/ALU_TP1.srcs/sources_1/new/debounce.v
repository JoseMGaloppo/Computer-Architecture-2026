
module debounce #(
    parameter DEBOUNCE_CYCLES = 200_000  // ~2 ms a 100 MHz
) (
    input  wire clk,
    input  wire btn_in,
    output reg  btn_pulse   // pulso de 1 ciclo por cada presion valida
);

    // Doble flip-flop sincronizador (evita metaestabilidad)
    reg btn_sync0, btn_sync1;
    always @(posedge clk) begin
        btn_sync0 <= btn_in;
        btn_sync1 <= btn_sync0;
    end

    // Contador de estabilidad
    reg [$clog2(DEBOUNCE_CYCLES+1)-1:0] counter;
    reg btn_stable, btn_stable_prev;

    always @(posedge clk) begin
        if (btn_sync1 == btn_stable) begin
            counter <= 0;
        end else begin
            counter <= counter + 1'b1;
            if (counter >= DEBOUNCE_CYCLES - 1) begin
                btn_stable <= btn_sync1;
                counter    <= 0;
            end
        end
        btn_stable_prev <= btn_stable;
    end

    always @(posedge clk) begin
        btn_pulse <= btn_stable & ~btn_stable_prev;  // flanco de subida
    end

endmodule