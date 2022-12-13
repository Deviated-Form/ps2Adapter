## This file is a general .xdc for the Zybo Z7 Rev. B
## It is compatible with the Zybo Z7-10
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project


###Basic IO
##Buttons
#set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { btn[0] }]; #IO_L12N_T1_MRCC_35 Sch=btn[0]
#set_property -dict { PACKAGE_PIN P16   IOSTANDARD LVCMOS33 } [get_ports { btn[1] }]; #IO_L24N_T3_34 Sch=btn[1]
#set_property -dict { PACKAGE_PIN K19   IOSTANDARD LVCMOS33 } [get_ports { btn[2] }]; #IO_L10P_T1_AD11P_35 Sch=btn[2]
#set_property -dict { PACKAGE_PIN Y16   IOSTANDARD LVCMOS33 } [get_ports { btn[3] }]; #IO_L7P_T1_34 Sch=btn[3]

###Pmods
##Pmod Header JA (XADC)
#set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { ja1p }]; #IO_L21P_T3_DQS_AD14P_35 Sch=JA1_R_p
#set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { ja2p }]; #IO_L22P_T3_AD7P_35 Sch=JA2_R_P
#set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { ja3p }]; #IO_L24P_T3_AD15P_35 Sch=JA3_R_P
#set_property -dict { PACKAGE_PIN K14   IOSTANDARD LVCMOS33 } [get_ports { ja4p }]; #IO_L20P_T3_AD6P_35 Sch=JA4_R_P
#set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports { ja1n }]; #IO_L21N_T3_DQS_AD14N_35 Sch=JA1_R_N
#set_property -dict { PACKAGE_PIN L15   IOSTANDARD LVCMOS33 } [get_ports { ja2n }]; #IO_L22N_T3_AD7N_35 Sch=JA2_R_N
#set_property -dict { PACKAGE_PIN J16   IOSTANDARD LVCMOS33 } [get_ports { ja3n }]; #IO_L24N_T3_AD15N_35 Sch=JA3_R_N
#set_property -dict { PACKAGE_PIN J14   IOSTANDARD LVCMOS33 } [get_ports { ja4n }]; #IO_L20N_T3_AD6N_35 Sch=JA4_R_N

##Pmod Header JD
#set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33  } [get_ports { jd[0] }]; #IO_L5P_T0_34 Sch=jd_p[1]
#set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33  } [get_ports { jd[1] }]; #IO_L5N_T0_34 Sch=jd_n[1]
#set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33  } [get_ports { jd[2] }]; #IO_L6P_T0_34 Sch=jd_p[2]
#set_property -dict { PACKAGE_PIN R14   IOSTANDARD LVCMOS33  } [get_ports { jd[3] }]; #IO_L6N_T0_VREF_34 Sch=jd_n[2]
#set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33  } [get_ports { jd[4] }]; #IO_L11P_T1_SRCC_34 Sch=jd_p[3]
#set_property -dict { PACKAGE_PIN U15   IOSTANDARD LVCMOS33  } [get_ports { jd[5] }]; #IO_L11N_T1_SRCC_34 Sch=jd_n[3]
#set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33  } [get_ports { jd[6] }]; #IO_L21P_T3_DQS_34 Sch=jd_p[4]
#set_property -dict { PACKAGE_PIN V18   IOSTANDARD LVCMOS33  } [get_ports { jd[7] }]; #IO_L21N_T3_DQS_34 Sch=jd_n[4]