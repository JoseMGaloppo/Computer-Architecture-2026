/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
IKI_DLLESPEC extern void execute_921(char*, char *);
IKI_DLLESPEC extern void execute_924(char*, char *);
IKI_DLLESPEC extern void execute_1715(char*, char *);
IKI_DLLESPEC extern void execute_1716(char*, char *);
IKI_DLLESPEC extern void execute_1717(char*, char *);
IKI_DLLESPEC extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
IKI_DLLESPEC extern void execute_967(char*, char *);
IKI_DLLESPEC extern void execute_930(char*, char *);
IKI_DLLESPEC extern void execute_931(char*, char *);
IKI_DLLESPEC extern void execute_932(char*, char *);
IKI_DLLESPEC extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
IKI_DLLESPEC extern void execute_935(char*, char *);
IKI_DLLESPEC extern void execute_936(char*, char *);
IKI_DLLESPEC extern void execute_937(char*, char *);
IKI_DLLESPEC extern void execute_938(char*, char *);
IKI_DLLESPEC extern void execute_12(char*, char *);
IKI_DLLESPEC extern void execute_13(char*, char *);
IKI_DLLESPEC extern void execute_21(char*, char *);
IKI_DLLESPEC extern void execute_972(char*, char *);
IKI_DLLESPEC extern void execute_973(char*, char *);
IKI_DLLESPEC extern void execute_974(char*, char *);
IKI_DLLESPEC extern void execute_975(char*, char *);
IKI_DLLESPEC extern void execute_976(char*, char *);
IKI_DLLESPEC extern void execute_977(char*, char *);
IKI_DLLESPEC extern void execute_978(char*, char *);
IKI_DLLESPEC extern void execute_979(char*, char *);
IKI_DLLESPEC extern void execute_971(char*, char *);
IKI_DLLESPEC extern void execute_24(char*, char *);
IKI_DLLESPEC extern void execute_25(char*, char *);
IKI_DLLESPEC extern void execute_69(char*, char *);
IKI_DLLESPEC extern void execute_70(char*, char *);
IKI_DLLESPEC extern void execute_72(char*, char *);
IKI_DLLESPEC extern void execute_73(char*, char *);
IKI_DLLESPEC extern void execute_74(char*, char *);
IKI_DLLESPEC extern void execute_1008(char*, char *);
IKI_DLLESPEC extern void execute_1009(char*, char *);
IKI_DLLESPEC extern void execute_1010(char*, char *);
IKI_DLLESPEC extern void execute_1011(char*, char *);
IKI_DLLESPEC extern void execute_1050(char*, char *);
IKI_DLLESPEC extern void execute_1051(char*, char *);
IKI_DLLESPEC extern void execute_120(char*, char *);
IKI_DLLESPEC extern void execute_121(char*, char *);
IKI_DLLESPEC extern void execute_122(char*, char *);
IKI_DLLESPEC extern void execute_1052(char*, char *);
IKI_DLLESPEC extern void execute_1053(char*, char *);
IKI_DLLESPEC extern void execute_1054(char*, char *);
IKI_DLLESPEC extern void execute_1055(char*, char *);
IKI_DLLESPEC extern void execute_137(char*, char *);
IKI_DLLESPEC extern void execute_1069(char*, char *);
IKI_DLLESPEC extern void execute_1070(char*, char *);
IKI_DLLESPEC extern void execute_1071(char*, char *);
IKI_DLLESPEC extern void execute_1072(char*, char *);
IKI_DLLESPEC extern void execute_1068(char*, char *);
IKI_DLLESPEC extern void execute_1712(char*, char *);
IKI_DLLESPEC extern void execute_1713(char*, char *);
IKI_DLLESPEC extern void execute_1714(char*, char *);
IKI_DLLESPEC extern void execute_926(char*, char *);
IKI_DLLESPEC extern void execute_927(char*, char *);
IKI_DLLESPEC extern void execute_928(char*, char *);
IKI_DLLESPEC extern void execute_929(char*, char *);
IKI_DLLESPEC extern void execute_1718(char*, char *);
IKI_DLLESPEC extern void execute_1719(char*, char *);
IKI_DLLESPEC extern void execute_1720(char*, char *);
IKI_DLLESPEC extern void execute_1721(char*, char *);
IKI_DLLESPEC extern void execute_1722(char*, char *);
IKI_DLLESPEC extern void execute_1723(char*, char *);
IKI_DLLESPEC extern void transaction_3(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_10(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_11(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_12(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_13(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_14(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_15(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_16(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_17(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
IKI_DLLESPEC extern void transaction_20(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_24(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_25(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_26(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_27(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_28(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_29(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_30(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_31(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_32(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_33(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_34(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_35(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_36(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_37(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_38(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_39(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_40(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_41(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_42(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_44(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_49(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_52(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_62(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_63(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_64(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_66(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_211(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_216(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_221(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_226(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_231(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_236(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_241(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_246(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_251(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_256(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_324(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_329(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_334(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_339(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_424(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_429(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_434(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_439(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_444(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_449(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_454(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_459(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_464(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_469(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_474(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_479(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_484(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_489(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_494(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_499(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_504(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_509(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_514(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_519(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_524(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_529(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_839(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_844(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_849(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_854(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_859(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_864(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_869(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_874(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_879(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_931(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_936(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_941(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_946(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_951(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_956(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_961(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_966(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1011(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1016(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1021(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1100(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1105(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1110(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1115(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1172(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1177(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1182(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1187(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1295(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1300(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1305(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1310(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1315(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1320(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1325(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1330(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1360(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1365(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1370(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1420(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1425(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1430(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1435(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1492(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1497(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1502(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1507(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_1526(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[187] = {(funcp)execute_921, (funcp)execute_924, (funcp)execute_1715, (funcp)execute_1716, (funcp)execute_1717, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_967, (funcp)execute_930, (funcp)execute_931, (funcp)execute_932, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_935, (funcp)execute_936, (funcp)execute_937, (funcp)execute_938, (funcp)execute_12, (funcp)execute_13, (funcp)execute_21, (funcp)execute_972, (funcp)execute_973, (funcp)execute_974, (funcp)execute_975, (funcp)execute_976, (funcp)execute_977, (funcp)execute_978, (funcp)execute_979, (funcp)execute_971, (funcp)execute_24, (funcp)execute_25, (funcp)execute_69, (funcp)execute_70, (funcp)execute_72, (funcp)execute_73, (funcp)execute_74, (funcp)execute_1008, (funcp)execute_1009, (funcp)execute_1010, (funcp)execute_1011, (funcp)execute_1050, (funcp)execute_1051, (funcp)execute_120, (funcp)execute_121, (funcp)execute_122, (funcp)execute_1052, (funcp)execute_1053, (funcp)execute_1054, (funcp)execute_1055, (funcp)execute_137, (funcp)execute_1069, (funcp)execute_1070, (funcp)execute_1071, (funcp)execute_1072, (funcp)execute_1068, (funcp)execute_1712, (funcp)execute_1713, (funcp)execute_1714, (funcp)execute_926, (funcp)execute_927, (funcp)execute_928, (funcp)execute_929, (funcp)execute_1718, (funcp)execute_1719, (funcp)execute_1720, (funcp)execute_1721, (funcp)execute_1722, (funcp)execute_1723, (funcp)transaction_3, (funcp)transaction_10, (funcp)transaction_11, (funcp)transaction_12, (funcp)transaction_13, (funcp)transaction_14, (funcp)transaction_15, (funcp)transaction_16, (funcp)transaction_17, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_20, (funcp)transaction_24, (funcp)transaction_25, (funcp)transaction_26, (funcp)transaction_27, (funcp)transaction_28, (funcp)transaction_29, (funcp)transaction_30, (funcp)transaction_31, (funcp)transaction_32, (funcp)transaction_33, (funcp)transaction_34, (funcp)transaction_35, (funcp)transaction_36, (funcp)transaction_37, (funcp)transaction_38, (funcp)transaction_39, (funcp)transaction_40, (funcp)transaction_41, (funcp)transaction_42, (funcp)transaction_44, (funcp)transaction_49, (funcp)transaction_52, (funcp)transaction_62, (funcp)transaction_63, (funcp)transaction_64, (funcp)transaction_66, (funcp)transaction_211, (funcp)transaction_216, (funcp)transaction_221, (funcp)transaction_226, (funcp)transaction_231, (funcp)transaction_236, (funcp)transaction_241, (funcp)transaction_246, (funcp)transaction_251, (funcp)transaction_256, (funcp)transaction_324, (funcp)transaction_329, (funcp)transaction_334, (funcp)transaction_339, (funcp)transaction_424, (funcp)transaction_429, (funcp)transaction_434, (funcp)transaction_439, (funcp)transaction_444, (funcp)transaction_449, (funcp)transaction_454, (funcp)transaction_459, (funcp)transaction_464, (funcp)transaction_469, (funcp)transaction_474, (funcp)transaction_479, (funcp)transaction_484, (funcp)transaction_489, (funcp)transaction_494, (funcp)transaction_499, (funcp)transaction_504, (funcp)transaction_509, (funcp)transaction_514, (funcp)transaction_519, (funcp)transaction_524, (funcp)transaction_529, (funcp)transaction_839, (funcp)transaction_844, (funcp)transaction_849, (funcp)transaction_854, (funcp)transaction_859, (funcp)transaction_864, (funcp)transaction_869, (funcp)transaction_874, (funcp)transaction_879, (funcp)transaction_931, (funcp)transaction_936, (funcp)transaction_941, (funcp)transaction_946, (funcp)transaction_951, (funcp)transaction_956, (funcp)transaction_961, (funcp)transaction_966, (funcp)transaction_1011, (funcp)transaction_1016, (funcp)transaction_1021, (funcp)transaction_1100, (funcp)transaction_1105, (funcp)transaction_1110, (funcp)transaction_1115, (funcp)transaction_1172, (funcp)transaction_1177, (funcp)transaction_1182, (funcp)transaction_1187, (funcp)transaction_1295, (funcp)transaction_1300, (funcp)transaction_1305, (funcp)transaction_1310, (funcp)transaction_1315, (funcp)transaction_1320, (funcp)transaction_1325, (funcp)transaction_1330, (funcp)transaction_1360, (funcp)transaction_1365, (funcp)transaction_1370, (funcp)transaction_1420, (funcp)transaction_1425, (funcp)transaction_1430, (funcp)transaction_1435, (funcp)transaction_1492, (funcp)transaction_1497, (funcp)transaction_1502, (funcp)transaction_1507, (funcp)transaction_1526};
const int NumRelocateId= 187;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/tb_uart_alu_system_func_impl/xsim.reloc",  (void **)funcTab, 187);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/tb_uart_alu_system_func_impl/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void wrapper_func_0(char *dp)

{

}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/tb_uart_alu_system_func_impl/xsim.reloc");
	wrapper_func_0(dp);

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_xsimdir_location_if_remapped(argc, argv)  ;
    iki_set_sv_type_file_path_name("xsim.dir/tb_uart_alu_system_func_impl/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/tb_uart_alu_system_func_impl/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/tb_uart_alu_system_func_impl/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
