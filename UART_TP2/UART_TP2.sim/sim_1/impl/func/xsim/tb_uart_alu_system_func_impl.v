// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Fri Sep 18 11:06:41 2026
// Host        : DESKTOP-RRFGTIG running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/Jose/TPs/Computer-Architecture-2026/UART_TP2/UART_TP2.sim/sim_1/impl/func/xsim/tb_uart_alu_system_func_impl.v
// Design      : uart_alu_system_top
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module alu
   (O,
    \reg_a_reg[6] ,
    data1,
    Q,
    S,
    \tx_data_reg[4]_i_3 ,
    \tx_data_reg[0]_i_4 ,
    \tx_data_reg[4]_i_2 );
  output [3:0]O;
  output [3:0]\reg_a_reg[6] ;
  output [7:0]data1;
  input [6:0]Q;
  input [3:0]S;
  input [3:0]\tx_data_reg[4]_i_3 ;
  input [3:0]\tx_data_reg[0]_i_4 ;
  input [3:0]\tx_data_reg[4]_i_2 ;

  wire [3:0]O;
  wire [6:0]Q;
  wire Result0_carry_n_0;
  wire \Result0_inferred__0/i__carry_n_0 ;
  wire [3:0]S;
  wire [7:0]data1;
  wire [3:0]\reg_a_reg[6] ;
  wire [3:0]\tx_data_reg[0]_i_4 ;
  wire [3:0]\tx_data_reg[4]_i_2 ;
  wire [3:0]\tx_data_reg[4]_i_3 ;
  wire [2:0]NLW_Result0_carry_CO_UNCONNECTED;
  wire [3:0]NLW_Result0_carry__0_CO_UNCONNECTED;
  wire [2:0]\NLW_Result0_inferred__0/i__carry_CO_UNCONNECTED ;
  wire [3:0]\NLW_Result0_inferred__0/i__carry__0_CO_UNCONNECTED ;

  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 Result0_carry
       (.CI(1'b0),
        .CO({Result0_carry_n_0,NLW_Result0_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI(Q[3:0]),
        .O(O),
        .S(S));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 Result0_carry__0
       (.CI(Result0_carry_n_0),
        .CO(NLW_Result0_carry__0_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,Q[6:4]}),
        .O(\reg_a_reg[6] ),
        .S(\tx_data_reg[4]_i_3 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Result0_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\Result0_inferred__0/i__carry_n_0 ,\NLW_Result0_inferred__0/i__carry_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b1),
        .DI(Q[3:0]),
        .O(data1[3:0]),
        .S(\tx_data_reg[0]_i_4 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Result0_inferred__0/i__carry__0 
       (.CI(\Result0_inferred__0/i__carry_n_0 ),
        .CO(\NLW_Result0_inferred__0/i__carry__0_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,Q[6:4]}),
        .O(data1[7:4]),
        .S(\tx_data_reg[4]_i_2 ));
endmodule

module alu_tx_interface
   (tx_start_wire,
    tx_start_reg_reg_0,
    D,
    \tx_data_reg_reg[6]_0 ,
    \tx_data_reg_reg[7]_0 ,
    CLK,
    AR,
    Q,
    \tx_data_reg_reg[7]_1 );
  output tx_start_wire;
  output tx_start_reg_reg_0;
  output [0:0]D;
  output [6:0]\tx_data_reg_reg[6]_0 ;
  input [0:0]\tx_data_reg_reg[7]_0 ;
  input CLK;
  input [0:0]AR;
  input [1:0]Q;
  input [7:0]\tx_data_reg_reg[7]_1 ;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]D;
  wire [1:0]Q;
  wire [7:7]tx_data_reg;
  wire [6:0]\tx_data_reg_reg[6]_0 ;
  wire [0:0]\tx_data_reg_reg[7]_0 ;
  wire [7:0]\tx_data_reg_reg[7]_1 ;
  wire tx_start_reg_reg_0;
  wire tx_start_wire;

  LUT2 #(
    .INIT(4'h2)) 
    \b_reg[7]_i_2 
       (.I0(tx_data_reg),
        .I1(Q[1]),
        .O(D));
  LUT2 #(
    .INIT(4'h8)) 
    \state_reg[3]_i_3__0 
       (.I0(tx_start_wire),
        .I1(Q[0]),
        .O(tx_start_reg_reg_0));
  FDCE #(
    .INIT(1'b0)) 
    \tx_data_reg_reg[0] 
       (.C(CLK),
        .CE(\tx_data_reg_reg[7]_0 ),
        .CLR(AR),
        .D(\tx_data_reg_reg[7]_1 [0]),
        .Q(\tx_data_reg_reg[6]_0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \tx_data_reg_reg[1] 
       (.C(CLK),
        .CE(\tx_data_reg_reg[7]_0 ),
        .CLR(AR),
        .D(\tx_data_reg_reg[7]_1 [1]),
        .Q(\tx_data_reg_reg[6]_0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \tx_data_reg_reg[2] 
       (.C(CLK),
        .CE(\tx_data_reg_reg[7]_0 ),
        .CLR(AR),
        .D(\tx_data_reg_reg[7]_1 [2]),
        .Q(\tx_data_reg_reg[6]_0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \tx_data_reg_reg[3] 
       (.C(CLK),
        .CE(\tx_data_reg_reg[7]_0 ),
        .CLR(AR),
        .D(\tx_data_reg_reg[7]_1 [3]),
        .Q(\tx_data_reg_reg[6]_0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \tx_data_reg_reg[4] 
       (.C(CLK),
        .CE(\tx_data_reg_reg[7]_0 ),
        .CLR(AR),
        .D(\tx_data_reg_reg[7]_1 [4]),
        .Q(\tx_data_reg_reg[6]_0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \tx_data_reg_reg[5] 
       (.C(CLK),
        .CE(\tx_data_reg_reg[7]_0 ),
        .CLR(AR),
        .D(\tx_data_reg_reg[7]_1 [5]),
        .Q(\tx_data_reg_reg[6]_0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \tx_data_reg_reg[6] 
       (.C(CLK),
        .CE(\tx_data_reg_reg[7]_0 ),
        .CLR(AR),
        .D(\tx_data_reg_reg[7]_1 [6]),
        .Q(\tx_data_reg_reg[6]_0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \tx_data_reg_reg[7] 
       (.C(CLK),
        .CE(\tx_data_reg_reg[7]_0 ),
        .CLR(AR),
        .D(\tx_data_reg_reg[7]_1 [7]),
        .Q(tx_data_reg));
  FDCE #(
    .INIT(1'b0)) 
    tx_start_reg_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\tx_data_reg_reg[7]_0 ),
        .Q(tx_start_wire));
endmodule

module baud_rate_generator
   (\r_reg_reg[3]_0 ,
    CLK,
    AR);
  output \r_reg_reg[3]_0 ;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [9:0]r_next;
  wire [9:0]r_reg;
  wire \r_reg[6]_i_2_n_0 ;
  wire \r_reg[7]_i_2_n_0 ;
  wire \r_reg[9]_i_2_n_0 ;
  wire \r_reg[9]_i_3_n_0 ;
  wire \r_reg[9]_i_4_n_0 ;
  wire \r_reg_reg[3]_0 ;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0000BFFF)) 
    \r_reg[0]_i_1 
       (.I0(\r_reg[7]_i_2_n_0 ),
        .I1(r_reg[3]),
        .I2(r_reg[1]),
        .I3(r_reg[7]),
        .I4(r_reg[0]),
        .O(r_next[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00FFDF00)) 
    \r_reg[1]_i_1 
       (.I0(r_reg[7]),
        .I1(\r_reg[7]_i_2_n_0 ),
        .I2(r_reg[3]),
        .I3(r_reg[1]),
        .I4(r_reg[0]),
        .O(r_next[1]));
  LUT3 #(
    .INIT(8'h78)) 
    \r_reg[2]_i_1 
       (.I0(r_reg[1]),
        .I1(r_reg[0]),
        .I2(r_reg[2]),
        .O(r_next[2]));
  LUT6 #(
    .INIT(64'h6626CC8CCCCCCCCC)) 
    \r_reg[3]_i_1 
       (.I0(r_reg[0]),
        .I1(r_reg[3]),
        .I2(r_reg[7]),
        .I3(\r_reg[7]_i_2_n_0 ),
        .I4(r_reg[2]),
        .I5(r_reg[1]),
        .O(r_next[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \r_reg[4]_i_1 
       (.I0(r_reg[2]),
        .I1(r_reg[3]),
        .I2(r_reg[1]),
        .I3(r_reg[0]),
        .I4(r_reg[4]),
        .O(r_next[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \r_reg[5]_i_1 
       (.I0(r_reg[2]),
        .I1(r_reg[4]),
        .I2(r_reg[3]),
        .I3(r_reg[1]),
        .I4(r_reg[0]),
        .I5(r_reg[5]),
        .O(r_next[5]));
  LUT5 #(
    .INIT(32'hFF7F0080)) 
    \r_reg[6]_i_1 
       (.I0(r_reg[4]),
        .I1(r_reg[2]),
        .I2(r_reg[5]),
        .I3(\r_reg[6]_i_2_n_0 ),
        .I4(r_reg[6]),
        .O(r_next[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \r_reg[6]_i_2 
       (.I0(r_reg[3]),
        .I1(r_reg[1]),
        .I2(r_reg[0]),
        .O(\r_reg[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC8CCCCCC62CCCCCC)) 
    \r_reg[7]_i_1 
       (.I0(r_reg[0]),
        .I1(r_reg[7]),
        .I2(\r_reg[7]_i_2_n_0 ),
        .I3(r_reg[3]),
        .I4(r_reg[1]),
        .I5(\r_reg[9]_i_4_n_0 ),
        .O(r_next[7]));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFFFFFF)) 
    \r_reg[7]_i_2 
       (.I0(r_reg[4]),
        .I1(r_reg[5]),
        .I2(r_reg[8]),
        .I3(r_reg[6]),
        .I4(r_reg[2]),
        .I5(r_reg[9]),
        .O(\r_reg[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFFFFF40000000)) 
    \r_reg[8]_i_1 
       (.I0(\r_reg[9]_i_4_n_0 ),
        .I1(r_reg[7]),
        .I2(r_reg[1]),
        .I3(r_reg[3]),
        .I4(r_reg[0]),
        .I5(r_reg[8]),
        .O(r_next[8]));
  LUT6 #(
    .INIT(64'hCCC8CCC8C3C8CCC8)) 
    \r_reg[9]_i_1 
       (.I0(\r_reg[9]_i_2_n_0 ),
        .I1(r_reg[9]),
        .I2(\r_reg[9]_i_3_n_0 ),
        .I3(r_reg[0]),
        .I4(r_reg[8]),
        .I5(\r_reg[9]_i_4_n_0 ),
        .O(r_next[9]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \r_reg[9]_i_2 
       (.I0(r_reg[2]),
        .I1(r_reg[6]),
        .I2(r_reg[8]),
        .I3(r_reg[5]),
        .I4(r_reg[4]),
        .O(\r_reg[9]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \r_reg[9]_i_3 
       (.I0(r_reg[3]),
        .I1(r_reg[1]),
        .I2(r_reg[7]),
        .O(\r_reg[9]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \r_reg[9]_i_4 
       (.I0(r_reg[5]),
        .I1(r_reg[2]),
        .I2(r_reg[4]),
        .I3(r_reg[6]),
        .O(\r_reg[9]_i_4_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_next[0]),
        .Q(r_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_next[1]),
        .Q(r_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_next[2]),
        .Q(r_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_next[3]),
        .Q(r_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_next[4]),
        .Q(r_reg[4]));
  FDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_next[5]),
        .Q(r_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_next[6]),
        .Q(r_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_next[7]),
        .Q(r_reg[7]));
  FDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_next[8]),
        .Q(r_reg[8]));
  FDCE #(
    .INIT(1'b0)) 
    \r_reg_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_next[9]),
        .Q(r_reg[9]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00004000)) 
    \s_reg[3]_i_3 
       (.I0(\r_reg[7]_i_2_n_0 ),
        .I1(r_reg[3]),
        .I2(r_reg[1]),
        .I3(r_reg[7]),
        .I4(r_reg[0]),
        .O(\r_reg_reg[3]_0 ));
endmodule

module rx_alu_interface
   (S,
    Q,
    \reg_a_reg[7]_0 ,
    \reg_b_reg[3]_0 ,
    \reg_b_reg[7]_0 ,
    \FSM_onehot_count_reg_reg[3]_0 ,
    D,
    E,
    CLK,
    AR,
    \reg_a_reg[7]_1 ,
    \reg_a_reg[7]_2 ,
    \reg_b_reg[7]_1 ,
    \reg_op_reg[5]_0 ,
    data1,
    O,
    \tx_data_reg_reg[7] );
  output [3:0]S;
  output [6:0]Q;
  output [3:0]\reg_a_reg[7]_0 ;
  output [3:0]\reg_b_reg[3]_0 ;
  output [3:0]\reg_b_reg[7]_0 ;
  output [3:0]\FSM_onehot_count_reg_reg[3]_0 ;
  output [7:0]D;
  input [0:0]E;
  input CLK;
  input [0:0]AR;
  input [0:0]\reg_a_reg[7]_1 ;
  input [7:0]\reg_a_reg[7]_2 ;
  input [0:0]\reg_b_reg[7]_1 ;
  input [0:0]\reg_op_reg[5]_0 ;
  input [7:0]data1;
  input [3:0]O;
  input [3:0]\tx_data_reg_reg[7] ;

  wire [0:0]AR;
  wire CLK;
  wire [7:0]D;
  wire [0:0]E;
  wire [3:0]\FSM_onehot_count_reg_reg[3]_0 ;
  wire [3:0]O;
  wire [6:0]Q;
  wire [3:0]S;
  wire [7:7]alu_a_wire;
  wire [7:0]alu_b_wire;
  wire [7:0]data1;
  wire [3:0]\reg_a_reg[7]_0 ;
  wire [0:0]\reg_a_reg[7]_1 ;
  wire [7:0]\reg_a_reg[7]_2 ;
  wire [3:0]\reg_b_reg[3]_0 ;
  wire [3:0]\reg_b_reg[7]_0 ;
  wire [0:0]\reg_b_reg[7]_1 ;
  wire [5:0]reg_op;
  wire [0:0]\reg_op_reg[5]_0 ;
  wire \tx_data_reg[0]_i_2_n_0 ;
  wire \tx_data_reg[0]_i_3_n_0 ;
  wire \tx_data_reg[0]_i_4_n_0 ;
  wire \tx_data_reg[0]_i_5_n_0 ;
  wire \tx_data_reg[0]_i_6_n_0 ;
  wire \tx_data_reg[0]_i_7_n_0 ;
  wire \tx_data_reg[1]_i_2_n_0 ;
  wire \tx_data_reg[1]_i_3_n_0 ;
  wire \tx_data_reg[1]_i_4_n_0 ;
  wire \tx_data_reg[1]_i_5_n_0 ;
  wire \tx_data_reg[2]_i_2_n_0 ;
  wire \tx_data_reg[2]_i_3_n_0 ;
  wire \tx_data_reg[2]_i_4_n_0 ;
  wire \tx_data_reg[2]_i_5_n_0 ;
  wire \tx_data_reg[2]_i_6_n_0 ;
  wire \tx_data_reg[3]_i_2_n_0 ;
  wire \tx_data_reg[3]_i_3_n_0 ;
  wire \tx_data_reg[3]_i_4_n_0 ;
  wire \tx_data_reg[3]_i_5_n_0 ;
  wire \tx_data_reg[3]_i_6_n_0 ;
  wire \tx_data_reg[4]_i_2_n_0 ;
  wire \tx_data_reg[4]_i_3_n_0 ;
  wire \tx_data_reg[4]_i_4_n_0 ;
  wire \tx_data_reg[4]_i_5_n_0 ;
  wire \tx_data_reg[4]_i_6_n_0 ;
  wire \tx_data_reg[5]_i_2_n_0 ;
  wire \tx_data_reg[5]_i_3_n_0 ;
  wire \tx_data_reg[5]_i_4_n_0 ;
  wire \tx_data_reg[5]_i_5_n_0 ;
  wire \tx_data_reg[6]_i_2_n_0 ;
  wire \tx_data_reg[6]_i_3_n_0 ;
  wire \tx_data_reg[6]_i_4_n_0 ;
  wire \tx_data_reg[6]_i_5_n_0 ;
  wire \tx_data_reg[6]_i_6_n_0 ;
  wire \tx_data_reg[6]_i_7_n_0 ;
  wire \tx_data_reg[6]_i_8_n_0 ;
  wire \tx_data_reg[6]_i_9_n_0 ;
  wire \tx_data_reg[7]_i_2_n_0 ;
  wire \tx_data_reg[7]_i_3_n_0 ;
  wire \tx_data_reg[7]_i_4_n_0 ;
  wire \tx_data_reg[7]_i_5_n_0 ;
  wire \tx_data_reg[7]_i_6_n_0 ;
  wire \tx_data_reg[7]_i_7_n_0 ;
  wire \tx_data_reg[7]_i_8_n_0 ;
  wire [3:0]\tx_data_reg_reg[7] ;

  (* FSM_ENCODED_STATES = "iSTATE:1000,iSTATE0:0001,iSTATE1:0010,iSTATE2:0100," *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_count_reg_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(\FSM_onehot_count_reg_reg[3]_0 [3]),
        .PRE(AR),
        .Q(\FSM_onehot_count_reg_reg[3]_0 [0]));
  (* FSM_ENCODED_STATES = "iSTATE:1000,iSTATE0:0001,iSTATE1:0010,iSTATE2:0100," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_count_reg_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\FSM_onehot_count_reg_reg[3]_0 [0]),
        .Q(\FSM_onehot_count_reg_reg[3]_0 [1]));
  (* FSM_ENCODED_STATES = "iSTATE:1000,iSTATE0:0001,iSTATE1:0010,iSTATE2:0100," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_count_reg_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\FSM_onehot_count_reg_reg[3]_0 [1]),
        .Q(\FSM_onehot_count_reg_reg[3]_0 [2]));
  (* FSM_ENCODED_STATES = "iSTATE:1000,iSTATE0:0001,iSTATE1:0010,iSTATE2:0100," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_count_reg_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\FSM_onehot_count_reg_reg[3]_0 [2]),
        .Q(\FSM_onehot_count_reg_reg[3]_0 [3]));
  LUT2 #(
    .INIT(4'h6)) 
    Result0_carry__0_i_1
       (.I0(alu_a_wire),
        .I1(alu_b_wire[7]),
        .O(\reg_a_reg[7]_0 [3]));
  LUT2 #(
    .INIT(4'h6)) 
    Result0_carry__0_i_2
       (.I0(Q[6]),
        .I1(alu_b_wire[6]),
        .O(\reg_a_reg[7]_0 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    Result0_carry__0_i_3
       (.I0(Q[5]),
        .I1(alu_b_wire[5]),
        .O(\reg_a_reg[7]_0 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    Result0_carry__0_i_4
       (.I0(Q[4]),
        .I1(alu_b_wire[4]),
        .O(\reg_a_reg[7]_0 [0]));
  LUT2 #(
    .INIT(4'h6)) 
    Result0_carry_i_1
       (.I0(Q[3]),
        .I1(alu_b_wire[3]),
        .O(S[3]));
  LUT2 #(
    .INIT(4'h6)) 
    Result0_carry_i_2
       (.I0(Q[2]),
        .I1(alu_b_wire[2]),
        .O(S[2]));
  LUT2 #(
    .INIT(4'h6)) 
    Result0_carry_i_3
       (.I0(Q[1]),
        .I1(alu_b_wire[1]),
        .O(S[1]));
  LUT2 #(
    .INIT(4'h6)) 
    Result0_carry_i_4
       (.I0(Q[0]),
        .I1(alu_b_wire[0]),
        .O(S[0]));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_1
       (.I0(alu_b_wire[7]),
        .I1(alu_a_wire),
        .O(\reg_b_reg[7]_0 [3]));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_2
       (.I0(alu_b_wire[6]),
        .I1(Q[6]),
        .O(\reg_b_reg[7]_0 [2]));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_3
       (.I0(alu_b_wire[5]),
        .I1(Q[5]),
        .O(\reg_b_reg[7]_0 [1]));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_4
       (.I0(alu_b_wire[4]),
        .I1(Q[4]),
        .O(\reg_b_reg[7]_0 [0]));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_1
       (.I0(alu_b_wire[3]),
        .I1(Q[3]),
        .O(\reg_b_reg[3]_0 [3]));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_2
       (.I0(alu_b_wire[2]),
        .I1(Q[2]),
        .O(\reg_b_reg[3]_0 [2]));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_3
       (.I0(alu_b_wire[1]),
        .I1(Q[1]),
        .O(\reg_b_reg[3]_0 [1]));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_4
       (.I0(alu_b_wire[0]),
        .I1(Q[0]),
        .O(\reg_b_reg[3]_0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_a_reg[0] 
       (.C(CLK),
        .CE(\reg_a_reg[7]_1 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_a_reg[1] 
       (.C(CLK),
        .CE(\reg_a_reg[7]_1 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_a_reg[2] 
       (.C(CLK),
        .CE(\reg_a_reg[7]_1 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_a_reg[3] 
       (.C(CLK),
        .CE(\reg_a_reg[7]_1 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_a_reg[4] 
       (.C(CLK),
        .CE(\reg_a_reg[7]_1 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_a_reg[5] 
       (.C(CLK),
        .CE(\reg_a_reg[7]_1 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_a_reg[6] 
       (.C(CLK),
        .CE(\reg_a_reg[7]_1 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_a_reg[7] 
       (.C(CLK),
        .CE(\reg_a_reg[7]_1 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [7]),
        .Q(alu_a_wire));
  FDCE #(
    .INIT(1'b0)) 
    \reg_b_reg[0] 
       (.C(CLK),
        .CE(\reg_b_reg[7]_1 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [0]),
        .Q(alu_b_wire[0]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_b_reg[1] 
       (.C(CLK),
        .CE(\reg_b_reg[7]_1 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [1]),
        .Q(alu_b_wire[1]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_b_reg[2] 
       (.C(CLK),
        .CE(\reg_b_reg[7]_1 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [2]),
        .Q(alu_b_wire[2]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_b_reg[3] 
       (.C(CLK),
        .CE(\reg_b_reg[7]_1 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [3]),
        .Q(alu_b_wire[3]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_b_reg[4] 
       (.C(CLK),
        .CE(\reg_b_reg[7]_1 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [4]),
        .Q(alu_b_wire[4]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_b_reg[5] 
       (.C(CLK),
        .CE(\reg_b_reg[7]_1 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [5]),
        .Q(alu_b_wire[5]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_b_reg[6] 
       (.C(CLK),
        .CE(\reg_b_reg[7]_1 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [6]),
        .Q(alu_b_wire[6]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_b_reg[7] 
       (.C(CLK),
        .CE(\reg_b_reg[7]_1 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [7]),
        .Q(alu_b_wire[7]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_op_reg[0] 
       (.C(CLK),
        .CE(\reg_op_reg[5]_0 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [0]),
        .Q(reg_op[0]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_op_reg[1] 
       (.C(CLK),
        .CE(\reg_op_reg[5]_0 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [1]),
        .Q(reg_op[1]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_op_reg[2] 
       (.C(CLK),
        .CE(\reg_op_reg[5]_0 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [2]),
        .Q(reg_op[2]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_op_reg[3] 
       (.C(CLK),
        .CE(\reg_op_reg[5]_0 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [3]),
        .Q(reg_op[3]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_op_reg[4] 
       (.C(CLK),
        .CE(\reg_op_reg[5]_0 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [4]),
        .Q(reg_op[4]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_op_reg[5] 
       (.C(CLK),
        .CE(\reg_op_reg[5]_0 ),
        .CLR(AR),
        .D(\reg_a_reg[7]_2 [5]),
        .Q(reg_op[5]));
  LUT6 #(
    .INIT(64'hFFFFFFF8F8F8F8F8)) 
    \tx_data_reg[0]_i_1 
       (.I0(\tx_data_reg[0]_i_2_n_0 ),
        .I1(\tx_data_reg[6]_i_5_n_0 ),
        .I2(\tx_data_reg[0]_i_3_n_0 ),
        .I3(\tx_data_reg[0]_i_4_n_0 ),
        .I4(\tx_data_reg[0]_i_5_n_0 ),
        .I5(\tx_data_reg[7]_i_6_n_0 ),
        .O(D[0]));
  LUT4 #(
    .INIT(16'h0008)) 
    \tx_data_reg[0]_i_2 
       (.I0(alu_a_wire),
        .I1(reg_op[0]),
        .I2(reg_op[2]),
        .I3(\tx_data_reg[6]_i_8_n_0 ),
        .O(\tx_data_reg[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0808080808000000)) 
    \tx_data_reg[0]_i_3 
       (.I0(\tx_data_reg[6]_i_8_n_0 ),
        .I1(\tx_data_reg[6]_i_5_n_0 ),
        .I2(reg_op[2]),
        .I3(\tx_data_reg[1]_i_5_n_0 ),
        .I4(alu_b_wire[0]),
        .I5(\tx_data_reg[0]_i_6_n_0 ),
        .O(\tx_data_reg[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h120FE0001200E000)) 
    \tx_data_reg[0]_i_4 
       (.I0(alu_b_wire[0]),
        .I1(Q[0]),
        .I2(reg_op[0]),
        .I3(reg_op[2]),
        .I4(reg_op[1]),
        .I5(data1[0]),
        .O(\tx_data_reg[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0C0E000200C20002)) 
    \tx_data_reg[0]_i_5 
       (.I0(O[0]),
        .I1(reg_op[2]),
        .I2(reg_op[1]),
        .I3(reg_op[0]),
        .I4(Q[0]),
        .I5(alu_b_wire[0]),
        .O(\tx_data_reg[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FF00E2E2)) 
    \tx_data_reg[0]_i_6 
       (.I0(Q[0]),
        .I1(alu_b_wire[2]),
        .I2(Q[4]),
        .I3(\tx_data_reg[0]_i_7_n_0 ),
        .I4(alu_b_wire[1]),
        .I5(alu_b_wire[0]),
        .O(\tx_data_reg[0]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \tx_data_reg[0]_i_7 
       (.I0(Q[6]),
        .I1(alu_b_wire[2]),
        .I2(Q[2]),
        .O(\tx_data_reg[0]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFFE0E0E0)) 
    \tx_data_reg[1]_i_1 
       (.I0(\tx_data_reg[1]_i_2_n_0 ),
        .I1(\tx_data_reg[1]_i_3_n_0 ),
        .I2(\tx_data_reg[7]_i_6_n_0 ),
        .I3(\tx_data_reg[1]_i_4_n_0 ),
        .I4(\tx_data_reg[6]_i_5_n_0 ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h120FE0001200E000)) 
    \tx_data_reg[1]_i_2 
       (.I0(alu_b_wire[1]),
        .I1(Q[1]),
        .I2(reg_op[0]),
        .I3(reg_op[2]),
        .I4(reg_op[1]),
        .I5(data1[1]),
        .O(\tx_data_reg[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0C0E000200C20002)) 
    \tx_data_reg[1]_i_3 
       (.I0(O[1]),
        .I1(reg_op[2]),
        .I2(reg_op[1]),
        .I3(reg_op[0]),
        .I4(Q[1]),
        .I5(alu_b_wire[1]),
        .O(\tx_data_reg[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFAABAAAAAAABAAA)) 
    \tx_data_reg[1]_i_4 
       (.I0(\tx_data_reg[0]_i_2_n_0 ),
        .I1(reg_op[2]),
        .I2(\tx_data_reg[1]_i_5_n_0 ),
        .I3(\tx_data_reg[6]_i_8_n_0 ),
        .I4(alu_b_wire[0]),
        .I5(\tx_data_reg[2]_i_5_n_0 ),
        .O(\tx_data_reg[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFCFC0C0CFA0AFA0A)) 
    \tx_data_reg[1]_i_5 
       (.I0(Q[1]),
        .I1(Q[5]),
        .I2(alu_b_wire[1]),
        .I3(Q[3]),
        .I4(alu_a_wire),
        .I5(alu_b_wire[2]),
        .O(\tx_data_reg[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF000E0000)) 
    \tx_data_reg[2]_i_1 
       (.I0(\tx_data_reg[2]_i_2_n_0 ),
        .I1(\tx_data_reg[2]_i_3_n_0 ),
        .I2(reg_op[4]),
        .I3(reg_op[3]),
        .I4(reg_op[5]),
        .I5(\tx_data_reg[2]_i_4_n_0 ),
        .O(D[2]));
  LUT6 #(
    .INIT(64'h120FE0001200E000)) 
    \tx_data_reg[2]_i_2 
       (.I0(alu_b_wire[2]),
        .I1(Q[2]),
        .I2(reg_op[0]),
        .I3(reg_op[2]),
        .I4(reg_op[1]),
        .I5(data1[2]),
        .O(\tx_data_reg[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0C0E000200C20002)) 
    \tx_data_reg[2]_i_3 
       (.I0(O[2]),
        .I1(reg_op[2]),
        .I2(reg_op[1]),
        .I3(reg_op[0]),
        .I4(Q[2]),
        .I5(alu_b_wire[2]),
        .O(\tx_data_reg[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA8A008000)) 
    \tx_data_reg[2]_i_4 
       (.I0(\tx_data_reg[6]_i_5_n_0 ),
        .I1(\tx_data_reg[3]_i_5_n_0 ),
        .I2(alu_b_wire[0]),
        .I3(\tx_data_reg[6]_i_8_n_0 ),
        .I4(\tx_data_reg[2]_i_5_n_0 ),
        .I5(\tx_data_reg[0]_i_2_n_0 ),
        .O(\tx_data_reg[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FF80FF00)) 
    \tx_data_reg[2]_i_5 
       (.I0(alu_b_wire[1]),
        .I1(alu_b_wire[2]),
        .I2(alu_a_wire),
        .I3(\tx_data_reg[2]_i_6_n_0 ),
        .I4(reg_op[0]),
        .I5(reg_op[2]),
        .O(\tx_data_reg[2]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \tx_data_reg[2]_i_6 
       (.I0(Q[4]),
        .I1(alu_b_wire[1]),
        .I2(Q[6]),
        .I3(alu_b_wire[2]),
        .I4(Q[2]),
        .O(\tx_data_reg[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF000E0000)) 
    \tx_data_reg[3]_i_1 
       (.I0(\tx_data_reg[3]_i_2_n_0 ),
        .I1(\tx_data_reg[3]_i_3_n_0 ),
        .I2(reg_op[4]),
        .I3(reg_op[3]),
        .I4(reg_op[5]),
        .I5(\tx_data_reg[3]_i_4_n_0 ),
        .O(D[3]));
  LUT6 #(
    .INIT(64'h120FE0001200E000)) 
    \tx_data_reg[3]_i_2 
       (.I0(alu_b_wire[3]),
        .I1(Q[3]),
        .I2(reg_op[0]),
        .I3(reg_op[2]),
        .I4(reg_op[1]),
        .I5(data1[3]),
        .O(\tx_data_reg[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0C0E000200C20002)) 
    \tx_data_reg[3]_i_3 
       (.I0(O[3]),
        .I1(reg_op[2]),
        .I2(reg_op[1]),
        .I3(reg_op[0]),
        .I4(Q[3]),
        .I5(alu_b_wire[3]),
        .O(\tx_data_reg[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAA0800080)) 
    \tx_data_reg[3]_i_4 
       (.I0(\tx_data_reg[6]_i_5_n_0 ),
        .I1(\tx_data_reg[3]_i_5_n_0 ),
        .I2(\tx_data_reg[6]_i_8_n_0 ),
        .I3(alu_b_wire[0]),
        .I4(\tx_data_reg[4]_i_5_n_0 ),
        .I5(\tx_data_reg[0]_i_2_n_0 ),
        .O(\tx_data_reg[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FF80FF00)) 
    \tx_data_reg[3]_i_5 
       (.I0(alu_b_wire[1]),
        .I1(alu_b_wire[2]),
        .I2(alu_a_wire),
        .I3(\tx_data_reg[3]_i_6_n_0 ),
        .I4(reg_op[0]),
        .I5(reg_op[2]),
        .O(\tx_data_reg[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h3300B8B8)) 
    \tx_data_reg[3]_i_6 
       (.I0(Q[5]),
        .I1(alu_b_wire[1]),
        .I2(Q[3]),
        .I3(alu_a_wire),
        .I4(alu_b_wire[2]),
        .O(\tx_data_reg[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF000E0000)) 
    \tx_data_reg[4]_i_1 
       (.I0(\tx_data_reg[4]_i_2_n_0 ),
        .I1(\tx_data_reg[4]_i_3_n_0 ),
        .I2(reg_op[4]),
        .I3(reg_op[3]),
        .I4(reg_op[5]),
        .I5(\tx_data_reg[4]_i_4_n_0 ),
        .O(D[4]));
  LUT6 #(
    .INIT(64'h120FE0001200E000)) 
    \tx_data_reg[4]_i_2 
       (.I0(alu_b_wire[4]),
        .I1(Q[4]),
        .I2(reg_op[0]),
        .I3(reg_op[2]),
        .I4(reg_op[1]),
        .I5(data1[4]),
        .O(\tx_data_reg[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0C0E000200C20002)) 
    \tx_data_reg[4]_i_3 
       (.I0(\tx_data_reg_reg[7] [0]),
        .I1(reg_op[2]),
        .I2(reg_op[1]),
        .I3(reg_op[0]),
        .I4(Q[4]),
        .I5(alu_b_wire[4]),
        .O(\tx_data_reg[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA8A008000)) 
    \tx_data_reg[4]_i_4 
       (.I0(\tx_data_reg[6]_i_5_n_0 ),
        .I1(\tx_data_reg[5]_i_5_n_0 ),
        .I2(alu_b_wire[0]),
        .I3(\tx_data_reg[6]_i_8_n_0 ),
        .I4(\tx_data_reg[4]_i_5_n_0 ),
        .I5(\tx_data_reg[0]_i_2_n_0 ),
        .O(\tx_data_reg[4]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h0000F8F0)) 
    \tx_data_reg[4]_i_5 
       (.I0(alu_a_wire),
        .I1(alu_b_wire[2]),
        .I2(\tx_data_reg[4]_i_6_n_0 ),
        .I3(reg_op[0]),
        .I4(reg_op[2]),
        .O(\tx_data_reg[4]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h00CA)) 
    \tx_data_reg[4]_i_6 
       (.I0(Q[4]),
        .I1(Q[6]),
        .I2(alu_b_wire[1]),
        .I3(alu_b_wire[2]),
        .O(\tx_data_reg[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF000E0000)) 
    \tx_data_reg[5]_i_1 
       (.I0(\tx_data_reg[5]_i_2_n_0 ),
        .I1(\tx_data_reg[5]_i_3_n_0 ),
        .I2(reg_op[4]),
        .I3(reg_op[3]),
        .I4(reg_op[5]),
        .I5(\tx_data_reg[5]_i_4_n_0 ),
        .O(D[5]));
  LUT6 #(
    .INIT(64'h120FE0001200E000)) 
    \tx_data_reg[5]_i_2 
       (.I0(alu_b_wire[5]),
        .I1(Q[5]),
        .I2(reg_op[0]),
        .I3(reg_op[2]),
        .I4(reg_op[1]),
        .I5(data1[5]),
        .O(\tx_data_reg[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0C0E000200C20002)) 
    \tx_data_reg[5]_i_3 
       (.I0(\tx_data_reg_reg[7] [1]),
        .I1(reg_op[2]),
        .I2(reg_op[1]),
        .I3(reg_op[0]),
        .I4(Q[5]),
        .I5(alu_b_wire[5]),
        .O(\tx_data_reg[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAA0800080)) 
    \tx_data_reg[5]_i_4 
       (.I0(\tx_data_reg[6]_i_5_n_0 ),
        .I1(\tx_data_reg[5]_i_5_n_0 ),
        .I2(\tx_data_reg[6]_i_8_n_0 ),
        .I3(alu_b_wire[0]),
        .I4(\tx_data_reg[6]_i_9_n_0 ),
        .I5(\tx_data_reg[0]_i_2_n_0 ),
        .O(\tx_data_reg[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000ABA80B08)) 
    \tx_data_reg[5]_i_5 
       (.I0(alu_a_wire),
        .I1(alu_b_wire[1]),
        .I2(alu_b_wire[2]),
        .I3(Q[5]),
        .I4(reg_op[0]),
        .I5(reg_op[2]),
        .O(\tx_data_reg[5]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFE0E0E0)) 
    \tx_data_reg[6]_i_1 
       (.I0(\tx_data_reg[6]_i_2_n_0 ),
        .I1(\tx_data_reg[6]_i_3_n_0 ),
        .I2(\tx_data_reg[7]_i_6_n_0 ),
        .I3(\tx_data_reg[6]_i_4_n_0 ),
        .I4(\tx_data_reg[6]_i_5_n_0 ),
        .O(D[6]));
  LUT6 #(
    .INIT(64'h120FE0001200E000)) 
    \tx_data_reg[6]_i_2 
       (.I0(alu_b_wire[6]),
        .I1(Q[6]),
        .I2(reg_op[0]),
        .I3(reg_op[2]),
        .I4(reg_op[1]),
        .I5(data1[6]),
        .O(\tx_data_reg[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0C0E000200C20002)) 
    \tx_data_reg[6]_i_3 
       (.I0(\tx_data_reg_reg[7] [2]),
        .I1(reg_op[2]),
        .I2(reg_op[1]),
        .I3(reg_op[0]),
        .I4(Q[6]),
        .I5(alu_b_wire[6]),
        .O(\tx_data_reg[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hEAFFC0C0EA00C0C0)) 
    \tx_data_reg[6]_i_4 
       (.I0(\tx_data_reg[6]_i_6_n_0 ),
        .I1(alu_a_wire),
        .I2(\tx_data_reg[6]_i_7_n_0 ),
        .I3(alu_b_wire[0]),
        .I4(\tx_data_reg[6]_i_8_n_0 ),
        .I5(\tx_data_reg[6]_i_9_n_0 ),
        .O(\tx_data_reg[6]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \tx_data_reg[6]_i_5 
       (.I0(reg_op[5]),
        .I1(reg_op[1]),
        .I2(reg_op[4]),
        .I3(reg_op[3]),
        .O(\tx_data_reg[6]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \tx_data_reg[6]_i_6 
       (.I0(reg_op[2]),
        .I1(alu_a_wire),
        .I2(alu_b_wire[2]),
        .I3(alu_b_wire[1]),
        .O(\tx_data_reg[6]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \tx_data_reg[6]_i_7 
       (.I0(reg_op[0]),
        .I1(reg_op[2]),
        .O(\tx_data_reg[6]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \tx_data_reg[6]_i_8 
       (.I0(alu_b_wire[3]),
        .I1(alu_b_wire[4]),
        .I2(alu_b_wire[5]),
        .I3(alu_b_wire[7]),
        .I4(alu_b_wire[6]),
        .O(\tx_data_reg[6]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h00000000ABA80300)) 
    \tx_data_reg[6]_i_9 
       (.I0(alu_a_wire),
        .I1(alu_b_wire[1]),
        .I2(alu_b_wire[2]),
        .I3(Q[6]),
        .I4(reg_op[0]),
        .I5(reg_op[2]),
        .O(\tx_data_reg[6]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFFFEAAAA)) 
    \tx_data_reg[7]_i_1 
       (.I0(\tx_data_reg[7]_i_2_n_0 ),
        .I1(\tx_data_reg[7]_i_3_n_0 ),
        .I2(\tx_data_reg[7]_i_4_n_0 ),
        .I3(\tx_data_reg[7]_i_5_n_0 ),
        .I4(\tx_data_reg[7]_i_6_n_0 ),
        .O(D[7]));
  LUT6 #(
    .INIT(64'h00F0001000000000)) 
    \tx_data_reg[7]_i_2 
       (.I0(\tx_data_reg[7]_i_7_n_0 ),
        .I1(\tx_data_reg[7]_i_8_n_0 ),
        .I2(\tx_data_reg[6]_i_5_n_0 ),
        .I3(reg_op[2]),
        .I4(reg_op[0]),
        .I5(alu_a_wire),
        .O(\tx_data_reg[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000880088F0)) 
    \tx_data_reg[7]_i_3 
       (.I0(alu_a_wire),
        .I1(alu_b_wire[7]),
        .I2(\tx_data_reg_reg[7] [3]),
        .I3(reg_op[2]),
        .I4(reg_op[0]),
        .I5(reg_op[1]),
        .O(\tx_data_reg[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h3008300830080008)) 
    \tx_data_reg[7]_i_4 
       (.I0(data1[7]),
        .I1(reg_op[1]),
        .I2(reg_op[2]),
        .I3(reg_op[0]),
        .I4(alu_a_wire),
        .I5(alu_b_wire[7]),
        .O(\tx_data_reg[7]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h10006000)) 
    \tx_data_reg[7]_i_5 
       (.I0(alu_a_wire),
        .I1(alu_b_wire[7]),
        .I2(reg_op[2]),
        .I3(reg_op[1]),
        .I4(reg_op[0]),
        .O(\tx_data_reg[7]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \tx_data_reg[7]_i_6 
       (.I0(reg_op[4]),
        .I1(reg_op[3]),
        .I2(reg_op[5]),
        .O(\tx_data_reg[7]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \tx_data_reg[7]_i_7 
       (.I0(alu_b_wire[1]),
        .I1(alu_b_wire[2]),
        .O(\tx_data_reg[7]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \tx_data_reg[7]_i_8 
       (.I0(alu_b_wire[0]),
        .I1(alu_b_wire[6]),
        .I2(alu_b_wire[7]),
        .I3(alu_b_wire[5]),
        .I4(alu_b_wire[4]),
        .I5(alu_b_wire[3]),
        .O(\tx_data_reg[7]_i_8_n_0 ));
endmodule

(* BAUD_RATE = "9600" *) (* CLK_FREQ = "100000000" *) (* DBIT = "8" *) 
(* ECO_CHECKSUM = "50606436" *) (* M_VAL = "651" *) (* N_VAL = "10" *) 
(* NotValidForBitStream *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
module uart_alu_system_top
   (clk,
    reset,
    rx_pin,
    tx_pin);
  input clk;
  input reset;
  input rx_pin;
  output tx_pin;

  wire [7:0]Result;
  wire [6:0]alu_a_wire;
  wire alu_inst_n_0;
  wire alu_inst_n_1;
  wire alu_inst_n_2;
  wire alu_inst_n_3;
  wire alu_inst_n_4;
  wire alu_inst_n_5;
  wire alu_inst_n_6;
  wire alu_inst_n_7;
  wire [7:7]b_next;
  wire baud_gen_inst_n_0;
  wire calc_done_wire;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [7:0]data1;
  wire interface_rx_inst_n_0;
  wire interface_rx_inst_n_1;
  wire interface_rx_inst_n_11;
  wire interface_rx_inst_n_12;
  wire interface_rx_inst_n_13;
  wire interface_rx_inst_n_14;
  wire interface_rx_inst_n_15;
  wire interface_rx_inst_n_16;
  wire interface_rx_inst_n_17;
  wire interface_rx_inst_n_18;
  wire interface_rx_inst_n_19;
  wire interface_rx_inst_n_2;
  wire interface_rx_inst_n_20;
  wire interface_rx_inst_n_21;
  wire interface_rx_inst_n_22;
  wire interface_rx_inst_n_24;
  wire interface_rx_inst_n_25;
  wire interface_rx_inst_n_26;
  wire interface_rx_inst_n_3;
  wire interface_tx_inst_n_1;
  wire [6:0]p_0_in;
  wire reg_a_next;
  wire reg_b_next;
  wire reg_op_next;
  wire reset;
  wire reset_IBUF;
  wire rx_inst_n_11;
  wire rx_inst_n_3;
  wire rx_pin;
  wire rx_pin_IBUF;
  wire [2:0]state_reg;
  wire [6:0]tx_data_reg;
  wire tx_pin;
  wire tx_pin_OBUF;
  wire tx_start_wire;

  alu alu_inst
       (.O({alu_inst_n_0,alu_inst_n_1,alu_inst_n_2,alu_inst_n_3}),
        .Q(alu_a_wire),
        .S({interface_rx_inst_n_0,interface_rx_inst_n_1,interface_rx_inst_n_2,interface_rx_inst_n_3}),
        .data1(data1),
        .\reg_a_reg[6] ({alu_inst_n_4,alu_inst_n_5,alu_inst_n_6,alu_inst_n_7}),
        .\tx_data_reg[0]_i_4 ({interface_rx_inst_n_15,interface_rx_inst_n_16,interface_rx_inst_n_17,interface_rx_inst_n_18}),
        .\tx_data_reg[4]_i_2 ({interface_rx_inst_n_19,interface_rx_inst_n_20,interface_rx_inst_n_21,interface_rx_inst_n_22}),
        .\tx_data_reg[4]_i_3 ({interface_rx_inst_n_11,interface_rx_inst_n_12,interface_rx_inst_n_13,interface_rx_inst_n_14}));
  baud_rate_generator baud_gen_inst
       (.AR(reset_IBUF),
        .CLK(clk_IBUF_BUFG),
        .\r_reg_reg[3]_0 (baud_gen_inst_n_0));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  rx_alu_interface interface_rx_inst
       (.AR(reset_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(Result),
        .E(rx_inst_n_3),
        .\FSM_onehot_count_reg_reg[3]_0 ({calc_done_wire,interface_rx_inst_n_24,interface_rx_inst_n_25,interface_rx_inst_n_26}),
        .O({alu_inst_n_0,alu_inst_n_1,alu_inst_n_2,alu_inst_n_3}),
        .Q(alu_a_wire),
        .S({interface_rx_inst_n_0,interface_rx_inst_n_1,interface_rx_inst_n_2,interface_rx_inst_n_3}),
        .data1(data1),
        .\reg_a_reg[7]_0 ({interface_rx_inst_n_11,interface_rx_inst_n_12,interface_rx_inst_n_13,interface_rx_inst_n_14}),
        .\reg_a_reg[7]_1 (reg_a_next),
        .\reg_a_reg[7]_2 ({p_0_in,rx_inst_n_11}),
        .\reg_b_reg[3]_0 ({interface_rx_inst_n_15,interface_rx_inst_n_16,interface_rx_inst_n_17,interface_rx_inst_n_18}),
        .\reg_b_reg[7]_0 ({interface_rx_inst_n_19,interface_rx_inst_n_20,interface_rx_inst_n_21,interface_rx_inst_n_22}),
        .\reg_b_reg[7]_1 (reg_b_next),
        .\reg_op_reg[5]_0 (reg_op_next),
        .\tx_data_reg_reg[7] ({alu_inst_n_4,alu_inst_n_5,alu_inst_n_6,alu_inst_n_7}));
  alu_tx_interface interface_tx_inst
       (.AR(reset_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(b_next),
        .Q({state_reg[2],state_reg[0]}),
        .\tx_data_reg_reg[6]_0 (tx_data_reg),
        .\tx_data_reg_reg[7]_0 (calc_done_wire),
        .\tx_data_reg_reg[7]_1 (Result),
        .tx_start_reg_reg_0(interface_tx_inst_n_1),
        .tx_start_wire(tx_start_wire));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  uart_rx rx_inst
       (.AR(reset_IBUF),
        .CLK(clk_IBUF_BUFG),
        .E(rx_inst_n_3),
        .\FSM_onehot_count_reg_reg[3] (reg_op_next),
        .\FSM_onehot_count_reg_reg[3]_0 (reg_b_next),
        .\FSM_onehot_count_reg_reg[3]_1 (reg_a_next),
        .Q({p_0_in,rx_inst_n_11}),
        .\reg_op_reg[5] ({calc_done_wire,interface_rx_inst_n_24,interface_rx_inst_n_25,interface_rx_inst_n_26}),
        .rx_pin_IBUF(rx_pin_IBUF),
        .\s_reg_reg[0]_0 (baud_gen_inst_n_0));
  IBUF rx_pin_IBUF_inst
       (.I(rx_pin),
        .O(rx_pin_IBUF));
  uart_tx tx_inst
       (.AR(reset_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(b_next),
        .Q({state_reg[2],state_reg[0]}),
        .\b_reg_reg[6]_0 (tx_data_reg),
        .\s_reg_reg[0]_0 (baud_gen_inst_n_0),
        .\state_reg_reg[0]_0 (interface_tx_inst_n_1),
        .tx_pin_OBUF(tx_pin_OBUF),
        .tx_start_wire(tx_start_wire));
  OBUF tx_pin_OBUF_inst
       (.I(tx_pin_OBUF),
        .O(tx_pin));
endmodule

module uart_rx
   (\FSM_onehot_count_reg_reg[3] ,
    \FSM_onehot_count_reg_reg[3]_0 ,
    \FSM_onehot_count_reg_reg[3]_1 ,
    E,
    Q,
    rx_pin_IBUF,
    \s_reg_reg[0]_0 ,
    \reg_op_reg[5] ,
    CLK,
    AR);
  output [0:0]\FSM_onehot_count_reg_reg[3] ;
  output [0:0]\FSM_onehot_count_reg_reg[3]_0 ;
  output [0:0]\FSM_onehot_count_reg_reg[3]_1 ;
  output [0:0]E;
  output [7:0]Q;
  input rx_pin_IBUF;
  input \s_reg_reg[0]_0 ;
  input [3:0]\reg_op_reg[5] ;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]E;
  wire \FSM_onehot_count_reg[3]_i_2_n_0 ;
  wire [0:0]\FSM_onehot_count_reg_reg[3] ;
  wire [0:0]\FSM_onehot_count_reg_reg[3]_0 ;
  wire [0:0]\FSM_onehot_count_reg_reg[3]_1 ;
  wire [7:0]Q;
  wire b_next;
  wire n_next;
  wire [2:0]n_reg;
  wire \n_reg[0]_i_1_n_0 ;
  wire \n_reg[1]_i_1_n_0 ;
  wire \n_reg[2]_i_1_n_0 ;
  wire \n_reg[2]_i_3_n_0 ;
  wire \n_reg[2]_i_4_n_0 ;
  wire [3:0]\reg_op_reg[5] ;
  wire rx_pin_IBUF;
  wire s_next;
  wire [3:0]s_reg;
  wire \s_reg[0]_i_1_n_0 ;
  wire \s_reg[1]_i_1_n_0 ;
  wire \s_reg[2]_i_1_n_0 ;
  wire \s_reg[2]_i_2_n_0 ;
  wire \s_reg[3]_i_2_n_0 ;
  wire \s_reg[3]_i_4_n_0 ;
  wire \s_reg[3]_i_5_n_0 ;
  wire \s_reg[3]_i_6_n_0 ;
  wire \s_reg_reg[0]_0 ;
  wire [3:0]state_next__0;
  wire [3:0]state_reg;
  wire \state_reg[3]_i_1__0_n_0 ;
  wire \state_reg[3]_i_3_n_0 ;
  wire \state_reg[3]_i_4_n_0 ;
  wire \state_reg[3]_i_5_n_0 ;
  wire \state_reg[3]_i_6_n_0 ;

  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hFFFF0008)) 
    \FSM_onehot_count_reg[3]_i_1 
       (.I0(\FSM_onehot_count_reg[3]_i_2_n_0 ),
        .I1(state_reg[3]),
        .I2(state_reg[2]),
        .I3(state_reg[1]),
        .I4(\reg_op_reg[5] [3]),
        .O(E));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \FSM_onehot_count_reg[3]_i_2 
       (.I0(s_reg[2]),
        .I1(s_reg[0]),
        .I2(s_reg[1]),
        .I3(s_reg[3]),
        .I4(\s_reg_reg[0]_0 ),
        .I5(state_reg[0]),
        .O(\FSM_onehot_count_reg[3]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0400)) 
    \b_reg[7]_i_1__0 
       (.I0(state_reg[1]),
        .I1(state_reg[2]),
        .I2(state_reg[3]),
        .I3(\FSM_onehot_count_reg[3]_i_2_n_0 ),
        .O(b_next));
  FDCE #(
    .INIT(1'b0)) 
    \b_reg_reg[0] 
       (.C(CLK),
        .CE(b_next),
        .CLR(AR),
        .D(Q[1]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \b_reg_reg[1] 
       (.C(CLK),
        .CE(b_next),
        .CLR(AR),
        .D(Q[2]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \b_reg_reg[2] 
       (.C(CLK),
        .CE(b_next),
        .CLR(AR),
        .D(Q[3]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \b_reg_reg[3] 
       (.C(CLK),
        .CE(b_next),
        .CLR(AR),
        .D(Q[4]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \b_reg_reg[4] 
       (.C(CLK),
        .CE(b_next),
        .CLR(AR),
        .D(Q[5]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \b_reg_reg[5] 
       (.C(CLK),
        .CE(b_next),
        .CLR(AR),
        .D(Q[6]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \b_reg_reg[6] 
       (.C(CLK),
        .CE(b_next),
        .CLR(AR),
        .D(Q[7]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \b_reg_reg[7] 
       (.C(CLK),
        .CE(b_next),
        .CLR(AR),
        .D(rx_pin_IBUF),
        .Q(Q[7]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h38)) 
    \n_reg[0]_i_1 
       (.I0(state_reg[2]),
        .I1(n_next),
        .I2(n_reg[0]),
        .O(\n_reg[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h2F80)) 
    \n_reg[1]_i_1 
       (.I0(state_reg[2]),
        .I1(n_reg[0]),
        .I2(n_next),
        .I3(n_reg[1]),
        .O(\n_reg[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h70FF8000)) 
    \n_reg[2]_i_1 
       (.I0(n_reg[0]),
        .I1(n_reg[1]),
        .I2(state_reg[2]),
        .I3(n_next),
        .I4(n_reg[2]),
        .O(\n_reg[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FF002000)) 
    \n_reg[2]_i_2 
       (.I0(s_reg[3]),
        .I1(state_reg[0]),
        .I2(\n_reg[2]_i_3_n_0 ),
        .I3(\s_reg_reg[0]_0 ),
        .I4(\n_reg[2]_i_4_n_0 ),
        .I5(\s_reg[3]_i_6_n_0 ),
        .O(n_next));
  LUT6 #(
    .INIT(64'h0004040404040404)) 
    \n_reg[2]_i_3 
       (.I0(state_reg[1]),
        .I1(state_reg[2]),
        .I2(state_reg[3]),
        .I3(n_reg[2]),
        .I4(n_reg[0]),
        .I5(n_reg[1]),
        .O(\n_reg[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h00000004)) 
    \n_reg[2]_i_4 
       (.I0(state_reg[0]),
        .I1(state_reg[1]),
        .I2(s_reg[3]),
        .I3(state_reg[3]),
        .I4(state_reg[2]),
        .O(\n_reg[2]_i_4_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \n_reg_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\n_reg[0]_i_1_n_0 ),
        .Q(n_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \n_reg_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\n_reg[1]_i_1_n_0 ),
        .Q(n_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \n_reg_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\n_reg[2]_i_1_n_0 ),
        .Q(n_reg[2]));
  LUT6 #(
    .INIT(64'h0000000000004000)) 
    \reg_a[7]_i_1 
       (.I0(\reg_op_reg[5] [3]),
        .I1(\reg_op_reg[5] [0]),
        .I2(\FSM_onehot_count_reg[3]_i_2_n_0 ),
        .I3(state_reg[3]),
        .I4(state_reg[2]),
        .I5(state_reg[1]),
        .O(\FSM_onehot_count_reg_reg[3]_1 ));
  LUT6 #(
    .INIT(64'h0000000000004000)) 
    \reg_b[7]_i_1 
       (.I0(\reg_op_reg[5] [3]),
        .I1(\reg_op_reg[5] [1]),
        .I2(\FSM_onehot_count_reg[3]_i_2_n_0 ),
        .I3(state_reg[3]),
        .I4(state_reg[2]),
        .I5(state_reg[1]),
        .O(\FSM_onehot_count_reg_reg[3]_0 ));
  LUT6 #(
    .INIT(64'h0000000000004000)) 
    \reg_op[5]_i_1 
       (.I0(\reg_op_reg[5] [3]),
        .I1(\reg_op_reg[5] [2]),
        .I2(\FSM_onehot_count_reg[3]_i_2_n_0 ),
        .I3(state_reg[3]),
        .I4(state_reg[2]),
        .I5(state_reg[1]),
        .O(\FSM_onehot_count_reg_reg[3] ));
  LUT6 #(
    .INIT(64'hFFFF555455545554)) 
    \s_reg[0]_i_1 
       (.I0(s_reg[0]),
        .I1(state_reg[2]),
        .I2(state_reg[1]),
        .I3(state_reg[3]),
        .I4(rx_pin_IBUF),
        .I5(state_reg[0]),
        .O(\s_reg[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h88F8F888)) 
    \s_reg[1]_i_1 
       (.I0(state_reg[0]),
        .I1(rx_pin_IBUF),
        .I2(\s_reg[2]_i_2_n_0 ),
        .I3(s_reg[1]),
        .I4(s_reg[0]),
        .O(\s_reg[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88F8F8F8F8888888)) 
    \s_reg[2]_i_1 
       (.I0(state_reg[0]),
        .I1(rx_pin_IBUF),
        .I2(\s_reg[2]_i_2_n_0 ),
        .I3(s_reg[1]),
        .I4(s_reg[0]),
        .I5(s_reg[2]),
        .O(\s_reg[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \s_reg[2]_i_2 
       (.I0(state_reg[2]),
        .I1(state_reg[1]),
        .I2(state_reg[3]),
        .O(\s_reg[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h8888F888)) 
    \s_reg[3]_i_1__0 
       (.I0(\s_reg_reg[0]_0 ),
        .I1(\s_reg[3]_i_4_n_0 ),
        .I2(\state_reg[3]_i_5_n_0 ),
        .I3(state_reg[0]),
        .I4(rx_pin_IBUF),
        .O(s_next));
  LUT6 #(
    .INIT(64'hEEEEEEEABBBBBABA)) 
    \s_reg[3]_i_2 
       (.I0(\s_reg[3]_i_5_n_0 ),
        .I1(\s_reg[3]_i_6_n_0 ),
        .I2(state_reg[3]),
        .I3(state_reg[1]),
        .I4(state_reg[2]),
        .I5(s_reg[3]),
        .O(\s_reg[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFEFEEEE00000000)) 
    \s_reg[3]_i_4 
       (.I0(state_reg[1]),
        .I1(state_reg[2]),
        .I2(s_reg[3]),
        .I3(\s_reg[3]_i_6_n_0 ),
        .I4(state_reg[3]),
        .I5(\state_reg[3]_i_5_n_0 ),
        .O(\s_reg[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_reg[3]_i_5 
       (.I0(state_reg[0]),
        .I1(rx_pin_IBUF),
        .O(\s_reg[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \s_reg[3]_i_6 
       (.I0(s_reg[1]),
        .I1(s_reg[0]),
        .I2(s_reg[2]),
        .O(\s_reg[3]_i_6_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \s_reg_reg[0] 
       (.C(CLK),
        .CE(s_next),
        .CLR(AR),
        .D(\s_reg[0]_i_1_n_0 ),
        .Q(s_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \s_reg_reg[1] 
       (.C(CLK),
        .CE(s_next),
        .CLR(AR),
        .D(\s_reg[1]_i_1_n_0 ),
        .Q(s_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \s_reg_reg[2] 
       (.C(CLK),
        .CE(s_next),
        .CLR(AR),
        .D(\s_reg[2]_i_1_n_0 ),
        .Q(s_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \s_reg_reg[3] 
       (.C(CLK),
        .CE(s_next),
        .CLR(AR),
        .D(\s_reg[3]_i_2_n_0 ),
        .Q(s_reg[3]));
  LUT4 #(
    .INIT(16'hFEEB)) 
    \state_reg[0]_i_1 
       (.I0(state_reg[3]),
        .I1(state_reg[0]),
        .I2(state_reg[1]),
        .I3(state_reg[2]),
        .O(state_next__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \state_reg[1]_i_1 
       (.I0(state_reg[0]),
        .I1(state_reg[3]),
        .I2(state_reg[1]),
        .I3(state_reg[2]),
        .O(state_next__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \state_reg[2]_i_1 
       (.I0(state_reg[0]),
        .I1(state_reg[1]),
        .I2(state_reg[3]),
        .I3(state_reg[2]),
        .O(state_next__0[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFFF040FFFF)) 
    \state_reg[3]_i_1__0 
       (.I0(\state_reg[3]_i_3_n_0 ),
        .I1(state_reg[2]),
        .I2(\state_reg[3]_i_4_n_0 ),
        .I3(state_reg[3]),
        .I4(\state_reg[3]_i_5_n_0 ),
        .I5(\state_reg[3]_i_6_n_0 ),
        .O(\state_reg[3]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'h0100)) 
    \state_reg[3]_i_2 
       (.I0(state_reg[1]),
        .I1(state_reg[0]),
        .I2(state_reg[3]),
        .I3(state_reg[2]),
        .O(state_next__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \state_reg[3]_i_3 
       (.I0(n_reg[1]),
        .I1(n_reg[0]),
        .I2(n_reg[2]),
        .O(\state_reg[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \state_reg[3]_i_4 
       (.I0(\s_reg_reg[0]_0 ),
        .I1(s_reg[3]),
        .I2(s_reg[1]),
        .I3(s_reg[0]),
        .I4(s_reg[2]),
        .O(\state_reg[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0116)) 
    \state_reg[3]_i_5 
       (.I0(state_reg[0]),
        .I1(state_reg[1]),
        .I2(state_reg[2]),
        .I3(state_reg[3]),
        .O(\state_reg[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h4444444444F44444)) 
    \state_reg[3]_i_6 
       (.I0(rx_pin_IBUF),
        .I1(state_reg[0]),
        .I2(\s_reg_reg[0]_0 ),
        .I3(s_reg[3]),
        .I4(state_reg[1]),
        .I5(\s_reg[3]_i_6_n_0 ),
        .O(\state_reg[3]_i_6_n_0 ));
  (* FSM_ENCODED_STATES = "IDLE:0001,START:0010,DATA:0100,STOP:1000," *) 
  FDPE #(
    .INIT(1'b1)) 
    \state_reg_reg[0] 
       (.C(CLK),
        .CE(\state_reg[3]_i_1__0_n_0 ),
        .D(state_next__0[0]),
        .PRE(AR),
        .Q(state_reg[0]));
  (* FSM_ENCODED_STATES = "IDLE:0001,START:0010,DATA:0100,STOP:1000," *) 
  FDCE #(
    .INIT(1'b0)) 
    \state_reg_reg[1] 
       (.C(CLK),
        .CE(\state_reg[3]_i_1__0_n_0 ),
        .CLR(AR),
        .D(state_next__0[1]),
        .Q(state_reg[1]));
  (* FSM_ENCODED_STATES = "IDLE:0001,START:0010,DATA:0100,STOP:1000," *) 
  FDCE #(
    .INIT(1'b0)) 
    \state_reg_reg[2] 
       (.C(CLK),
        .CE(\state_reg[3]_i_1__0_n_0 ),
        .CLR(AR),
        .D(state_next__0[2]),
        .Q(state_reg[2]));
  (* FSM_ENCODED_STATES = "IDLE:0001,START:0010,DATA:0100,STOP:1000," *) 
  FDCE #(
    .INIT(1'b0)) 
    \state_reg_reg[3] 
       (.C(CLK),
        .CE(\state_reg[3]_i_1__0_n_0 ),
        .CLR(AR),
        .D(state_next__0[3]),
        .Q(state_reg[3]));
endmodule

module uart_tx
   (tx_pin_OBUF,
    Q,
    CLK,
    AR,
    tx_start_wire,
    \s_reg_reg[0]_0 ,
    \state_reg_reg[0]_0 ,
    D,
    \b_reg_reg[6]_0 );
  output tx_pin_OBUF;
  output [1:0]Q;
  input CLK;
  input [0:0]AR;
  input tx_start_wire;
  input \s_reg_reg[0]_0 ;
  input \state_reg_reg[0]_0 ;
  input [0:0]D;
  input [6:0]\b_reg_reg[6]_0 ;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]D;
  wire [1:0]Q;
  wire [6:0]b_next;
  wire b_next_0;
  wire [6:0]\b_reg_reg[6]_0 ;
  wire \b_reg_reg_n_0_[0] ;
  wire \b_reg_reg_n_0_[1] ;
  wire \b_reg_reg_n_0_[2] ;
  wire \b_reg_reg_n_0_[3] ;
  wire \b_reg_reg_n_0_[4] ;
  wire \b_reg_reg_n_0_[5] ;
  wire \b_reg_reg_n_0_[6] ;
  wire \b_reg_reg_n_0_[7] ;
  wire [2:0]n_reg;
  wire \n_reg[0]_i_1_n_0 ;
  wire \n_reg[1]_i_1_n_0 ;
  wire \n_reg[1]_i_2_n_0 ;
  wire \n_reg[2]_i_1_n_0 ;
  wire \n_reg[2]_i_2__0_n_0 ;
  wire s_next;
  wire [3:0]s_reg;
  wire \s_reg[0]_i_1__0_n_0 ;
  wire \s_reg[1]_i_1__0_n_0 ;
  wire \s_reg[2]_i_1__0_n_0 ;
  wire \s_reg[3]_i_2__0_n_0 ;
  wire \s_reg[3]_i_3__0_n_0 ;
  wire \s_reg[3]_i_4__0_n_0 ;
  wire \s_reg_reg[0]_0 ;
  wire [3:0]state_next__0;
  wire [3:1]state_reg;
  wire \state_reg[3]_i_1_n_0 ;
  wire \state_reg[3]_i_4__0_n_0 ;
  wire \state_reg[3]_i_5__0_n_0 ;
  wire \state_reg[3]_i_6__0_n_0 ;
  wire \state_reg[3]_i_7_n_0 ;
  wire \state_reg_reg[0]_0 ;
  wire tx_next;
  wire tx_pin_OBUF;
  wire tx_reg_i_2_n_0;
  wire tx_start_wire;

  LUT3 #(
    .INIT(8'hB8)) 
    \b_reg[0]_i_1 
       (.I0(\b_reg_reg[6]_0 [0]),
        .I1(Q[0]),
        .I2(\b_reg_reg_n_0_[1] ),
        .O(b_next[0]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \b_reg[1]_i_1 
       (.I0(\b_reg_reg[6]_0 [1]),
        .I1(Q[0]),
        .I2(\b_reg_reg_n_0_[2] ),
        .O(b_next[1]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \b_reg[2]_i_1 
       (.I0(\b_reg_reg[6]_0 [2]),
        .I1(Q[0]),
        .I2(\b_reg_reg_n_0_[3] ),
        .O(b_next[2]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \b_reg[3]_i_1 
       (.I0(\b_reg_reg[6]_0 [3]),
        .I1(Q[0]),
        .I2(\b_reg_reg_n_0_[4] ),
        .O(b_next[3]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \b_reg[4]_i_1 
       (.I0(\b_reg_reg[6]_0 [4]),
        .I1(Q[0]),
        .I2(\b_reg_reg_n_0_[5] ),
        .O(b_next[4]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \b_reg[5]_i_1 
       (.I0(\b_reg_reg[6]_0 [5]),
        .I1(Q[0]),
        .I2(\b_reg_reg_n_0_[6] ),
        .O(b_next[5]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \b_reg[6]_i_1 
       (.I0(\b_reg_reg[6]_0 [6]),
        .I1(Q[0]),
        .I2(\b_reg_reg_n_0_[7] ),
        .O(b_next[6]));
  LUT6 #(
    .INIT(64'h0003020000000200)) 
    \b_reg[7]_i_1 
       (.I0(\state_reg[3]_i_5__0_n_0 ),
        .I1(state_reg[1]),
        .I2(state_reg[3]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(tx_start_wire),
        .O(b_next_0));
  FDCE #(
    .INIT(1'b0)) 
    \b_reg_reg[0] 
       (.C(CLK),
        .CE(b_next_0),
        .CLR(AR),
        .D(b_next[0]),
        .Q(\b_reg_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \b_reg_reg[1] 
       (.C(CLK),
        .CE(b_next_0),
        .CLR(AR),
        .D(b_next[1]),
        .Q(\b_reg_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \b_reg_reg[2] 
       (.C(CLK),
        .CE(b_next_0),
        .CLR(AR),
        .D(b_next[2]),
        .Q(\b_reg_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \b_reg_reg[3] 
       (.C(CLK),
        .CE(b_next_0),
        .CLR(AR),
        .D(b_next[3]),
        .Q(\b_reg_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \b_reg_reg[4] 
       (.C(CLK),
        .CE(b_next_0),
        .CLR(AR),
        .D(b_next[4]),
        .Q(\b_reg_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \b_reg_reg[5] 
       (.C(CLK),
        .CE(b_next_0),
        .CLR(AR),
        .D(b_next[5]),
        .Q(\b_reg_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \b_reg_reg[6] 
       (.C(CLK),
        .CE(b_next_0),
        .CLR(AR),
        .D(b_next[6]),
        .Q(\b_reg_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \b_reg_reg[7] 
       (.C(CLK),
        .CE(b_next_0),
        .CLR(AR),
        .D(D),
        .Q(\b_reg_reg_n_0_[7] ));
  LUT6 #(
    .INIT(64'h00FF3FFFAA008000)) 
    \n_reg[0]_i_1 
       (.I0(Q[1]),
        .I1(\state_reg[3]_i_6__0_n_0 ),
        .I2(state_next__0[3]),
        .I3(\state_reg[3]_i_5__0_n_0 ),
        .I4(state_next__0[2]),
        .I5(n_reg[0]),
        .O(\n_reg[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h44FF4FFF88008000)) 
    \n_reg[1]_i_1 
       (.I0(n_reg[0]),
        .I1(Q[1]),
        .I2(\n_reg[1]_i_2_n_0 ),
        .I3(\state_reg[3]_i_5__0_n_0 ),
        .I4(state_next__0[2]),
        .I5(n_reg[1]),
        .O(\n_reg[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h7F00)) 
    \n_reg[1]_i_2 
       (.I0(n_reg[2]),
        .I1(n_reg[0]),
        .I2(n_reg[1]),
        .I3(state_next__0[3]),
        .O(\n_reg[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8282CCCC8ECCCCCC)) 
    \n_reg[2]_i_1 
       (.I0(Q[1]),
        .I1(n_reg[2]),
        .I2(\n_reg[2]_i_2__0_n_0 ),
        .I3(state_next__0[3]),
        .I4(\state_reg[3]_i_5__0_n_0 ),
        .I5(state_next__0[2]),
        .O(\n_reg[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \n_reg[2]_i_2__0 
       (.I0(n_reg[0]),
        .I1(n_reg[1]),
        .O(\n_reg[2]_i_2__0_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \n_reg_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\n_reg[0]_i_1_n_0 ),
        .Q(n_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \n_reg_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\n_reg[1]_i_1_n_0 ),
        .Q(n_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \n_reg_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\n_reg[2]_i_1_n_0 ),
        .Q(n_reg[2]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \s_reg[0]_i_1__0 
       (.I0(s_reg[0]),
        .I1(Q[0]),
        .O(\s_reg[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \s_reg[1]_i_1__0 
       (.I0(s_reg[0]),
        .I1(s_reg[1]),
        .I2(Q[0]),
        .O(\s_reg[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h0078)) 
    \s_reg[2]_i_1__0 
       (.I0(s_reg[0]),
        .I1(s_reg[1]),
        .I2(s_reg[2]),
        .I3(Q[0]),
        .O(\s_reg[2]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hF8880000)) 
    \s_reg[3]_i_1 
       (.I0(tx_start_wire),
        .I1(Q[0]),
        .I2(\s_reg_reg[0]_0 ),
        .I3(\s_reg[3]_i_3__0_n_0 ),
        .I4(\state_reg[3]_i_7_n_0 ),
        .O(s_next));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h00007F80)) 
    \s_reg[3]_i_2__0 
       (.I0(s_reg[1]),
        .I1(s_reg[0]),
        .I2(s_reg[2]),
        .I3(s_reg[3]),
        .I4(Q[0]),
        .O(\s_reg[3]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF2AAAAAAA)) 
    \s_reg[3]_i_3__0 
       (.I0(state_reg[3]),
        .I1(s_reg[2]),
        .I2(s_reg[0]),
        .I3(s_reg[1]),
        .I4(s_reg[3]),
        .I5(\s_reg[3]_i_4__0_n_0 ),
        .O(\s_reg[3]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \s_reg[3]_i_4__0 
       (.I0(state_reg[1]),
        .I1(Q[1]),
        .O(\s_reg[3]_i_4__0_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \s_reg_reg[0] 
       (.C(CLK),
        .CE(s_next),
        .CLR(AR),
        .D(\s_reg[0]_i_1__0_n_0 ),
        .Q(s_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \s_reg_reg[1] 
       (.C(CLK),
        .CE(s_next),
        .CLR(AR),
        .D(\s_reg[1]_i_1__0_n_0 ),
        .Q(s_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \s_reg_reg[2] 
       (.C(CLK),
        .CE(s_next),
        .CLR(AR),
        .D(\s_reg[2]_i_1__0_n_0 ),
        .Q(s_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \s_reg_reg[3] 
       (.C(CLK),
        .CE(s_next),
        .CLR(AR),
        .D(\s_reg[3]_i_2__0_n_0 ),
        .Q(s_reg[3]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hFEEB)) 
    \state_reg[0]_i_1__0 
       (.I0(state_reg[3]),
        .I1(Q[0]),
        .I2(state_reg[1]),
        .I3(Q[1]),
        .O(state_next__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \state_reg[1]_i_1__0 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(state_reg[3]),
        .I3(state_reg[1]),
        .O(state_next__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \state_reg[2]_i_1__0 
       (.I0(Q[0]),
        .I1(state_reg[1]),
        .I2(state_reg[3]),
        .I3(Q[1]),
        .O(state_next__0[2]));
  LUT6 #(
    .INIT(64'hEAEAFAEAFFFFFFFF)) 
    \state_reg[3]_i_1 
       (.I0(\state_reg_reg[0]_0 ),
        .I1(\state_reg[3]_i_4__0_n_0 ),
        .I2(\state_reg[3]_i_5__0_n_0 ),
        .I3(Q[1]),
        .I4(\state_reg[3]_i_6__0_n_0 ),
        .I5(\state_reg[3]_i_7_n_0 ),
        .O(\state_reg[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \state_reg[3]_i_2__0 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(state_reg[3]),
        .I3(state_reg[1]),
        .O(state_next__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \state_reg[3]_i_4__0 
       (.I0(state_reg[1]),
        .I1(state_reg[3]),
        .O(\state_reg[3]_i_4__0_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \state_reg[3]_i_5__0 
       (.I0(\s_reg_reg[0]_0 ),
        .I1(s_reg[3]),
        .I2(s_reg[1]),
        .I3(s_reg[0]),
        .I4(s_reg[2]),
        .O(\state_reg[3]_i_5__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \state_reg[3]_i_6__0 
       (.I0(n_reg[1]),
        .I1(n_reg[0]),
        .I2(n_reg[2]),
        .O(\state_reg[3]_i_6__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h0116)) 
    \state_reg[3]_i_7 
       (.I0(Q[0]),
        .I1(state_reg[1]),
        .I2(Q[1]),
        .I3(state_reg[3]),
        .O(\state_reg[3]_i_7_n_0 ));
  (* FSM_ENCODED_STATES = "IDLE:0001,START:0010,DATA:0100,STOP:1000," *) 
  FDPE #(
    .INIT(1'b1)) 
    \state_reg_reg[0] 
       (.C(CLK),
        .CE(\state_reg[3]_i_1_n_0 ),
        .D(state_next__0[0]),
        .PRE(AR),
        .Q(Q[0]));
  (* FSM_ENCODED_STATES = "IDLE:0001,START:0010,DATA:0100,STOP:1000," *) 
  FDCE #(
    .INIT(1'b0)) 
    \state_reg_reg[1] 
       (.C(CLK),
        .CE(\state_reg[3]_i_1_n_0 ),
        .CLR(AR),
        .D(state_next__0[1]),
        .Q(state_reg[1]));
  (* FSM_ENCODED_STATES = "IDLE:0001,START:0010,DATA:0100,STOP:1000," *) 
  FDCE #(
    .INIT(1'b0)) 
    \state_reg_reg[2] 
       (.C(CLK),
        .CE(\state_reg[3]_i_1_n_0 ),
        .CLR(AR),
        .D(state_next__0[2]),
        .Q(Q[1]));
  (* FSM_ENCODED_STATES = "IDLE:0001,START:0010,DATA:0100,STOP:1000," *) 
  FDCE #(
    .INIT(1'b0)) 
    \state_reg_reg[3] 
       (.C(CLK),
        .CE(\state_reg[3]_i_1_n_0 ),
        .CLR(AR),
        .D(state_next__0[3]),
        .Q(state_reg[3]));
  LUT4 #(
    .INIT(16'h0116)) 
    tx_reg_i_1
       (.I0(state_reg[1]),
        .I1(state_reg[3]),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(tx_next));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h0B)) 
    tx_reg_i_2
       (.I0(\b_reg_reg_n_0_[0] ),
        .I1(Q[1]),
        .I2(state_reg[1]),
        .O(tx_reg_i_2_n_0));
  FDPE #(
    .INIT(1'b1)) 
    tx_reg_reg
       (.C(CLK),
        .CE(tx_next),
        .D(tx_reg_i_2_n_0),
        .PRE(AR),
        .Q(tx_pin_OBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
