# ==============================================================================
# constraints.xdc - Archivo de Restricciones para Basys 3 (Artix-7 XC7A35T)
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. Restricción de Tiempo (Clock Constraint) - Fundamental para el STA
# ------------------------------------------------------------------------------
# El oscilador físico está en el pin W5 a 100 MHz (Periodo = 10.000 ns)
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
# Esta línea elimina la alerta de "Non-clocked sequential cell":
create_clock -add -name sys_clk_pin -period 10.000 -waveform {0 5.000} [get_ports clk]

# ------------------------------------------------------------------------------
# 2. Reset (Mapeado al Botón Central 'btnC' de la placa)
# ------------------------------------------------------------------------------
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

# ------------------------------------------------------------------------------
# 3. Interfaz USB-UART (Pines conectados al chip puente FTDI de la placa)
# ------------------------------------------------------------------------------
# Pin RX de la FPGA (Recibe datos de la PC)
set_property PACKAGE_PIN B18 [get_ports rx_pin]
set_property IOSTANDARD LVCMOS33 [get_ports rx_pin]

# Pin TX de la FPGA (Envía datos a la PC)
set_property PACKAGE_PIN A18 [get_ports tx_pin]
set_property IOSTANDARD LVCMOS33 [get_ports tx_pin]