import serial

# ==============================================================================
# Parámetros del Enlace
# ==============================================================================
PORT = 'COM11'  # Cambiar a 'COM3', 'COM4', etc. si estás en Windows
BAUD_RATE = 9600

# ==============================================================================
# Diccionario de Traducción Lógica (ASCII -> Opcode)
# ==============================================================================
OP_MAP = {
    '+': 0x20,  # ADD: 6'b100000
    '-': 0x22,  # SUB: 6'b100010
    '&': 0x24,  # AND: 6'b100100
    '|': 0x25,  # OR : 6'b100101
    '^': 0x26,  # XOR: 6'b100110
    '>': 0x03,  # SRA: 6'b000011 (Shift aritmético a derecha)
    '}': 0x02,  # SRL: 6'b000010 (Shift lógico a derecha)
    '~': 0x27   # NOR: 6'b100111
}

def enviar_operacion(a_str, b_str, op_char):
    try:
        # Transformamos los caracteres '0'-'9' a valores enteros 0-9
        a_val = int(a_str)
        b_val = int(b_str)
    except ValueError:
        print("[-] Error: Los operandos deben ser números de un dígito (0 al 9).")
        return

    if op_char not in OP_MAP:
        print(f"[-] Error: Operación '{op_char}' no soportada por el hardware.")
        return

    op_val = OP_MAP[op_char]

    try:
        # Se abre el puerto. Al salir de este bloque, se cierra automáticamente.
        with serial.Serial(PORT, BAUD_RATE, timeout=2.0) as ser:
            ser.reset_input_buffer()
            ser.reset_output_buffer()
            
            # Ensamblamos la trama secuencial
            trama = bytes([a_val, b_val, op_val])
            print(f"[*] Transmitiendo -> A: {a_val}, B: {b_val}, OP: {op_char} (0x{op_val:02X})")
            
            # Escribimos al puerto físico
            ser.write(trama)
            ser.flush()
            
            # Nos quedamos esperando 1 byte del módulo TX de la FPGA
            respuesta = ser.read(1)
            
            if respuesta:
                resultado = respuesta[0]
                print(f"[+] RX Exitoso. Resultado de la ALU: {resultado} (0x{resultado:02X})")
            else:
                print("[-] Timeout: El hardware no respondió.")
                
    except serial.SerialException as e:
        print(f"[!] Falla en la capa física serial: {e}")

if __name__ == "__main__":
    print("=========================================")
    print("  CONSOLA INTERACTIVA UART - ALU")
    print("=========================================")
    print("Operadores: +, -, &, |, ^, >, }, ~")
    print("Sintaxis de ejemplo: 5 + 3")
    print("Escribe 'salir' para apagar la consola.\n")
    
    while True:
        entrada = input(">>> Ingrese cálculo: ").strip()
        
        if entrada.lower() == 'salir':
            print("Cerrando la sesión serial...")
            break
            
        partes = entrada.split()
        if len(partes) != 3:
            print("[-] Sintaxis inválida. Formato: A OP B (ej: 4 & 2)")
            continue
            
        enviar_operacion(partes[0], partes[2], partes[1])
        print("-" * 45)