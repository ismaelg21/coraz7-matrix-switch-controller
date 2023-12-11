## This file is the .xdc for the Cora Z7-07S to support 16 spi master with 1 slave ea. 
## 


## ChipKit SPI
# SPI Master 0
set_property -dict { PACKAGE_PIN T12   IOSTANDARD LVCMOS33 } [get_ports { spi_m0_io0_io }]; #IO_L2P_T0_34 Sch=ck_mosi
set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33 } [get_ports { spi_m0_io1_io }]; #IO_L10N_T1_34 Sch=ck_miso
set_property -dict { PACKAGE_PIN H15   IOSTANDARD LVCMOS33 } [get_ports { spi_m0_sck_io }]; #IO_L19P_T3_35 Sch=ck_sck
set_property -dict { PACKAGE_PIN F16   IOSTANDARD LVCMOS33 } [get_ports { spi_m0_ss_io }]; #IO_L6P_T0_35 Sch=ck_ss


## ChipKit Outer Digital Header
# SPI Master 1
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { spi_m1_io0_io }]; #IO_L11P_T1_SRCC_34 Sch=ck_io[0]
set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS33 } [get_ports { spi_m1_io1_io }]; #IO_L3N_T0_DQS_34 Sch=ck_io[1]
set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { spi_m1_sck_io }]; #IO_L5P_T0_34 Sch=ck_io[2]
set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { spi_m1_ss_io }]; #IO_L5N_T0_34 Sch=ck_io[3]

# SPI Master 2
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { spi_m2_io0_io }]; #IO_L21P_T3_DQS_34 Sch=ck_io[4]
set_property -dict { PACKAGE_PIN V18   IOSTANDARD LVCMOS33 } [get_ports { spi_m2_io1_io }]; #IO_L21N_T3_DQS_34 Sch=ck_io[5]
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { spi_m2_sck_io }]; #IO_L19N_T3_VREF_34 Sch=ck_io[6]
set_property -dict { PACKAGE_PIN R14   IOSTANDARD LVCMOS33 } [get_ports { spi_m2_ss_io }]; #IO_L6N_T0_VREF_34 Sch=ck_io[7]

# SPI Master 3
set_property -dict { PACKAGE_PIN N18   IOSTANDARD LVCMOS33 } [get_ports { spi_m3_io0_io }]; #IO_L13P_T2_MRCC_34 Sch=ck_io[8]
set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports { spi_m3_io1_io }]; #IO_L8N_T1_AD10N_35 Sch=ck_io[9]
set_property -dict { PACKAGE_PIN U15   IOSTANDARD LVCMOS33 } [get_ports { spi_m3_sck_io }]; #IO_L11N_T1_SRCC_34 Sch=ck_io[10]
set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { spi_m3_ss_io }]; #IO_L12N_T1_MRCC_35 Sch=ck_io[11]

# SPI Master 4
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports { spi_m4_io0_io }]; #IO_L14P_T2_AD4P_SRCC_35 Sch=ck_io[12]
set_property -dict { PACKAGE_PIN G15   IOSTANDARD LVCMOS33 } [get_ports { spi_m4_io1_io }]; #IO_L19N_T3_VREF_35 Sch=ck_io[13]
## ChipKit I2C
set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { spi_m4_sck_io }]; #IO_L24P_T3_34 Sch=ck_sda
set_property -dict { PACKAGE_PIN P16   IOSTANDARD LVCMOS33 } [get_ports { spi_m4_ss_io }]; #IO_L24N_T3_34 Sch=ck_scl


## ChipKit Inner Digital Header
# SPI Master 5
set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports { spi_m5_io0_io }]; #IO_L19P_T3_34 Sch=ck_io[26]
set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports { spi_m5_io1_io }]; #IO_L2N_T0_34 Sch=ck_io[27]
set_property -dict { PACKAGE_PIN U13   IOSTANDARD LVCMOS33 } [get_ports { spi_m5_sck_io }]; #IO_L3P_T0_DQS_PUDC_B_34 Sch=ck_io[28]
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { spi_m5_ss_io }]; #IO_L10P_T1_34 Sch=ck_io[29]

# SPI Master 6
set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { spi_m6_io0_io }]; #IO_L9P_T1_DQS_34 Sch=ck_io[30]
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { spi_m6_io1_io }]; #IO_L9N_T1_DQS_34 Sch=ck_io[31]
set_property -dict { PACKAGE_PIN T17   IOSTANDARD LVCMOS33 } [get_ports { spi_m6_sck_io }]; #IO_L20P_T3_34 Sch=ck_io[32]
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { spi_m6_ss_io }]; #IO_L20N_T3_34 Sch=ck_io[33]

# SPI Master 7
set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports { spi_m7_io0_io }]; #IO_L23N_T3_34 Sch=ck_io[34]
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { spi_m7_io1_io }]; #IO_L23P_T3_34 Sch=ck_io[35]
set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { spi_m7_sck_io }]; #IO_L8P_T1_AD10P_35 Sch=ck_io[36]
set_property -dict { PACKAGE_PIN L17   IOSTANDARD LVCMOS33 } [get_ports { spi_m7_ss_io }]; #IO_L11N_T1_SRCC_35 Sch=ck_io[37]

# SPI Master 8
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { spi_m8_io0_io }]; #IO_L13N_T2_MRCC_35 Sch=ck_io[38]
set_property -dict { PACKAGE_PIN H18   IOSTANDARD LVCMOS33 } [get_ports { spi_m8_io1_io }]; #IO_L14N_T2_AD4N_SRCC_35 Sch=ck_io[39]
set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVCMOS33 } [get_ports { spi_m8_sck_io }]; #IO_L16N_T2_35 Sch=ck_io[40]
set_property -dict { PACKAGE_PIN L20   IOSTANDARD LVCMOS33 } [get_ports { spi_m8_ss_io }]; #IO_L9N_T1_DQS_AD3N_35 Sch=ck_io[41]



## User Digital I/O Header J1
# SPI Master 9
set_property -dict { PACKAGE_PIN L19   IOSTANDARD LVCMOS33 } [get_ports { spi_m9_io0_io }]; #IO_L9P_T1_DQS_AD3P_35 Sch=user_dio[1]
set_property -dict { PACKAGE_PIN M19   IOSTANDARD LVCMOS33 } [get_ports { spi_m9_io1_io }]; #IO_L7P_T1_AD2P_35 Sch=user_dio[2]
set_property -dict { PACKAGE_PIN N20   IOSTANDARD LVCMOS33 } [get_ports { spi_m9_sck_io }]; #IO_L14P_T2_SRCC_34 Sch=user_dio[3]
set_property -dict { PACKAGE_PIN P20   IOSTANDARD LVCMOS33 } [get_ports { spi_m9_ss_io }]; #IO_L14N_T2_SRCC_34 Sch=user_dio[4]

# SPI Master 10
set_property -dict { PACKAGE_PIN P19   IOSTANDARD LVCMOS33 } [get_ports { spi_m10_io0_io }]; #IO_L13N_T2_MRCC_34 Sch=user_dio[5]
set_property -dict { PACKAGE_PIN R19   IOSTANDARD LVCMOS33 } [get_ports { spi_m10_io1_io }]; #IO_0_34 Sch=user_dio[6]
set_property -dict { PACKAGE_PIN T20   IOSTANDARD LVCMOS33 } [get_ports { spi_m10_sck_io }]; #IO_L15P_T2_DQS_34 Sch=user_dio[7]
set_property -dict { PACKAGE_PIN T19   IOSTANDARD LVCMOS33 } [get_ports { spi_m10_ss_io }]; #IO_25_34 Sch=user_dio[8]

# SPI Master 11
set_property -dict { PACKAGE_PIN U20   IOSTANDARD LVCMOS33 } [get_ports { spi_m11_io0_io }]; #IO_L15N_T2_DQS_34 Sch=user_dio[9]
set_property -dict { PACKAGE_PIN V20   IOSTANDARD LVCMOS33 } [get_ports { spi_m11_io1_io }]; #IO_L16P_T2_34 Sch=user_dio[10]
set_property -dict { PACKAGE_PIN W20   IOSTANDARD LVCMOS33 } [get_ports { spi_m11_sck_io }]; #IO_L16N_T2_34 Sch=user_dio[11]
set_property -dict { PACKAGE_PIN K19   IOSTANDARD LVCMOS33 } [get_ports { spi_m11_ss_io }]; #IO_L10P_T1_AD11P_35 Sch=user_dio[12]



## Pmod Header JA
# SPI Master 12
set_property -dict { PACKAGE_PIN Y18   IOSTANDARD LVCMOS33 } [get_ports { spi_m12_io0_io }]; #IO_L17P_T2_34 Sch=ja_p[1]
set_property -dict { PACKAGE_PIN Y19   IOSTANDARD LVCMOS33 } [get_ports { spi_m12_io1_io }]; #IO_L17N_T2_34 Sch=ja_n[1]
set_property -dict { PACKAGE_PIN Y16   IOSTANDARD LVCMOS33 } [get_ports { spi_m12_sck_io }]; #IO_L7P_T1_34 Sch=ja_p[2]
set_property -dict { PACKAGE_PIN Y17   IOSTANDARD LVCMOS33 } [get_ports { spi_m12_ss_io }]; #IO_L7N_T1_34 Sch=ja_n[2]

# SPI Master 13
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { spi_m13_io0_io }]; #IO_L12P_T1_MRCC_34 Sch=ja_p[3]
set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports { spi_m13_io1_io }]; #IO_L12N_T1_MRCC_34 Sch=ja_n[3]
set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS33 } [get_ports { spi_m13_sck_io }]; #IO_L22P_T3_34 Sch=ja_p[4]
set_property -dict { PACKAGE_PIN W19   IOSTANDARD LVCMOS33 } [get_ports { spi_m13_ss_io }]; #IO_L22N_T3_34 Sch=ja_n[4]


## Pmod Header JB
# SPI Master 14
set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33 } [get_ports { spi_m14_io0_io }]; #IO_L8P_T1_34 Sch=jb_p[1]
set_property -dict { PACKAGE_PIN Y14   IOSTANDARD LVCMOS33 } [get_ports { spi_m14_io1_io }]; #IO_L8N_T1_34 Sch=jb_n[1]
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { spi_m14_sck_io }]; #IO_L1P_T0_34 Sch=jb_p[2]
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { spi_m14_ss_io }]; #IO_L1N_T0_34 Sch=jb_n[2]

# SPI Master 15
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { spi_m15_io0_io }]; #IO_L18P_T2_34 Sch=jb_p[3]
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports { spi_m15_io1_io }]; #IO_L18N_T2_34 Sch=jb_n[3]
set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { spi_m15_sck_io }]; #IO_L4P_T0_34 Sch=jb_p[4]
set_property -dict { PACKAGE_PIN W13   IOSTANDARD LVCMOS33 } [get_ports { spi_m15_ss_io }]; #IO_L4N_T0_34 Sch=jb_n[4]



