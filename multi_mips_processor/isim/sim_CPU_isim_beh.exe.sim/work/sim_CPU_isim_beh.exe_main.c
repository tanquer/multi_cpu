/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000003689083669_2073026168_init();
    work_m_00000000001979192164_3508565487_init();
    xilinxcorelib_ver_m_00000000001358910285_1120459105_init();
    xilinxcorelib_ver_m_00000000001687936702_4190540447_init();
    xilinxcorelib_ver_m_00000000000277421008_0378006782_init();
    xilinxcorelib_ver_m_00000000001603977570_1937808163_init();
    work_m_00000000000403262735_2381739659_init();
    work_m_00000000003147597282_0415424234_init();
    work_m_00000000000155220515_2362729609_init();
    work_m_00000000002081146973_0886308060_init();
    work_m_00000000004050678762_1137345619_init();
    work_m_00000000001264234804_3823007873_init();
    work_m_00000000000285270965_0376884500_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000285270965_0376884500");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
