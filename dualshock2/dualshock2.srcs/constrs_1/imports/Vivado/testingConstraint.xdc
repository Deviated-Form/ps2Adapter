## This file is a general .xdc for the Zybo Z7 Rev. B
## It is compatible with the Zybo Z7-10
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project


###Basic IO
##Switches
set_property -dict { PACKAGE_PIN G15   IOSTANDARD LVCMOS33 } [get_ports { sw0 }]; #IO_L19N_T3_VREF_35 Sch=sw[0]
set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { sw1 }]; #IO_L24P_T3_34 Sch=sw[1]
set_property -dict { PACKAGE_PIN W13   IOSTANDARD LVCMOS33 } [get_ports { sw2 }]; #IO_L4N_T0_34 Sch=sw[2]
#set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { sw3 }]; #IO_L9P_T1_DQS_34 Sch=sw[3]


##LEDs
set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { led0 }]; #IO_L23P_T3_35 Sch=led[0]
set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports { led1 }]; #IO_L23N_T3_35 Sch=led[1]
set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { led2 }]; #IO_0_35 Sch=led[2]
set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { led3 }]; #IO_L3N_T0_DQS_AD1N_35 Sch=led[3]

##RGB LED 6
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { led6_r }]; #IO_L18P_T2_34 Sch=led6_r
set_property -dict { PACKAGE_PIN F17   IOSTANDARD LVCMOS33 } [get_ports { led6_g }]; #IO_L6N_T0_VREF_35 Sch=led6_g
set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { led6_b }]; #IO_L8P_T1_AD10P_35 Sch=led6_b


###Pmods
##Pmod Header JC
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33  } [get_ports { jc0 }]; #IO_L10P_T1_34 Sch=jc_p[1]
set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33  } [get_ports { jc1 }]; #IO_L10N_T1_34 Sch=jc_n[1]
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33  } [get_ports { jc2 }]; #IO_L1P_T0_34 Sch=jc_p[2]
#set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33  } [get_ports { jc3 }]; #IO_L1N_T0_34 Sch=jc_n[2]
set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33  } [get_ports { jc4 }]; #IO_L8P_T1_34 Sch=jc_p[3]
set_property -dict { PACKAGE_PIN Y14   IOSTANDARD LVCMOS33  } [get_ports { jc5 }]; #IO_L8N_T1_34 Sch=jc_n[3]
#set_property -dict { PACKAGE_PIN T12   IOSTANDARD LVCMOS33  } [get_ports { jc6 }]; #IO_L2P_T0_34 Sch=jc_p[4]
#set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33  } [get_ports { jc7 }]; #IO_L2N_T0_34 Sch=jc_n[4]

