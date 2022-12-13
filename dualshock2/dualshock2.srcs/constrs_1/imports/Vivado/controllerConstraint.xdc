## This file is a general .xdc for the Zybo Z7 Rev. B
## It is compatible with the Zybo Z7-10
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project


##Clock signal
##125 MHz
set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { sysClk125M }]; #IO_L12P_T1_MRCC_35 Sch=sysClk125M
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 5} [get_ports { sysClk125M }];

##Pmod Header JE
set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { je0 }]; #IO_L4P_T0_34 Sch=je[1]
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports { je1 }]; #IO_L18N_T2_34 Sch=je[2]
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { je2 }]; #IO_25_35 Sch=je[3]
#set_property -dict { PACKAGE_PIN H15   IOSTANDARD LVCMOS33 } [get_ports { je3 }]; #IO_L19P_T3_35 Sch=je[4]
set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS33   PULLUP true } [get_ports { je4 }]; #IO_L3N_T0_DQS_34 Sch=je[7]
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33   PULLUP true } [get_ports { je5 }]; #IO_L9N_T1_DQS_34 Sch=je[8]
#set_property -dict { PACKAGE_PIN T17   IOSTANDARD LVCMOS33 } [get_ports { je6 }]; #IO_L20P_T3_34 Sch=je[9]
#set_property -dict { PACKAGE_PIN Y17   IOSTANDARD LVCMOS33 } [get_ports { je7 }]; #IO_L7N_T1_34 Sch=je[10]
