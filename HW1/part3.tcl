#################
# Part 3 answers
#################



##############################################
# 1. find all ports
get_ports

@innovus 5> get_ports
bist_fh[2] bist_fh[1] bist_fh[0] bist_mis[2] bist_mis[1] bist_mis[0] clk clk_cpu em_a[27] em_a[26] em_a[25] em_a[24] em_a[23] em_a[22] em_a[21] em_a[20] em_a[19] em_a[18] em_a[17] em_a[16] em_a[15] em_a[14] em_a[13] em_a[12] em_a[11] em_a[10] em_a[9] em_a[8] em_a[7] em_a[6] em_a[5] em_a[4] em_a[3] em_a[2] em_a[1] em_a[0] em_d0[7] em_d0[6] em_d0[5] em_d0[4] em_d0[3] em_d0[2] em_d0[1] em_d0[0] em_d1[7] em_d1[6] em_d1[5] em_d1[4] em_d1[3] em_d1[2] em_d1[1] em_d1[0] em_d2[7] em_d2[6] em_d2[5] em_d2[4] em_d2[3] em_d2[2] em_d2[1] em_d2[0] em_d3[7] em_d3[6] em_d3[5] em_d3[4] em_d3[3] em_d3[2] em_d3[1] em_d3[0] em_ios_n em_oe_n em_ramoe_n[3] em_ramoe_n[2] em_ramoe_n[1] em_ramoe_n[0] em_rams_n[3] em_rams_n[2] em_rams_n[1] em_rams_n[0] em_read em_roms_n[1] em_roms_n[0] em_rwe_n[3] em_rwe_n[2] em_rwe_n[1] em_rwe_n[0] em_write_n ide_cs_n[1] ide_cs_n[0] ide_da[2] ide_da[1] ide_da[0] ide_dd[15] ide_dd[14] ide_dd[13] ide_dd[12] ide_dd[11] ide_dd[10] ide_dd[9] ide_dd[8] ide_dd[7] ...
0

##############################################
# 2. find all nets which are connected to ports
all_fanout -from [get_ports]

@innovus 9> all_fanout -from [get_ports]                                                                                                     bist_fh[2] bist_fh[1] bist_fh[0] bist_mis[2] bist_mis[1] bist_mis[0] clk clk_cpu em_a[27] em_a[26] em_a[25] em_a[24] em_a[23] em_a[22] em_a[21] em_a[20] em_a[19] em_a[18] em_a[17] em_a[16] em_a[15] em_a[14] em_a[13] em_a[12] em_a[11] em_a[10] em_a[9] em_a[8] em_a[7] em_a[6] em_a[5] em_a[4] em_a[3] em_a[2] em_a[1] em_a[0] em_d0[7] em_d0[6] em_d0[5] em_d0[4] em_d0[3] em_d0[2] em_d0[1] em_d0[0] em_d1[7] em_d1[6] em_d1[5] em_d1[4] em_d1[3] em_d1[2] em_d1[1] em_d1[0] em_d2[7] em_d2[6] em_d2[5] em_d2[4] em_d2[3] em_d2[2] em_d2[1] em_d2[0] em_d3[7] em_d3[6] em_d3[5] em_d3[4] em_d3[3] em_d3[2] em_d3[1] em_d3[0] em_ios_n em_oe_n em_ramoe_n[3] em_ramoe_n[2] em_ramoe_n[1] em_ramoe_n[0] em_rams_n[3] em_rams_n[2] em_rams_n[1] em_rams_n[0] em_read em_roms_n[1] em_roms_n[0] em_rwe_n[3] em_rwe_n[2] em_rwe_n[1] em_rwe_n[0] em_write_n ide_cs_n[1] ide_cs_n[0] ide_da[2] ide_da[1] ide_da[0] ide_dd[15] ide_dd[14] ide_dd[13] ide_dd[12] ide_dd[11] ide_dd[10] ide_dd[9] ide_dd[8] ide_dd[7] ...   ringinst/pad265clk/PAD ringinst/pad265clk/OUT coreinst/ks_core1/amba_dsp1/mcore0/ahb0/r_reg_hcache/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ahb0/r_reg_hmaster_0/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ahb0/r_reg_hmasterlock/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ahb0/r_reg_hmasterlock2/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ahb0/r_reg_hready/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ahb0/r_reg_hslave_0/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ahb0/r_reg_hslave_1/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ahb0/r_reg_hslave_2/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ahb0/r_reg_htrans_1/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/apb0/r_reg_haddr_2/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/apb0/r_reg_haddr_3/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/apb0/r_reg_haddr_4/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/apb0/r_reg_haddr_5/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/apb0/r_reg_haddr_6/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/apb0/r_reg_haddr_7/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/apb0/r_reg_haddr_8/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/apb0/r_reg_haddr_9/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/apb0/r_reg_hready/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/apb0/r_reg_hready2/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/apb0/r_reg_hsel/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/apb0/r_reg_hwrite/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/apb0/r_reg_penable/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_0/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_1/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_10/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_11/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_12/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_13/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_14/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_15/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_16/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_17/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_18/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_19/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_2/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_20/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_21/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_22/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_23/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_24/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_25/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_26/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_27/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_28/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_29/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_3/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_30/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_31/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_4/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_5/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_6/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_7/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_8/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_address_9/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_ahberr/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_hmaster_0/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_hmaster_1/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_hmaster_2/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_hmaster_3/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_hresp_0/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_hresp_1/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_hsize_0/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_hsize_1/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_hsize_2/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_newerr/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/asm/r_reg_read/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_0_edge/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_0_enable/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_0_isel_0/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_0_isel_1/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_0_isel_2/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_0_isel_3/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_0_isel_4/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_0_pol/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_1_edge/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_1_enable/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_1_isel_0/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_1_isel_1/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_1_isel_2/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_1_isel_3/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_1_isel_4/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_1_pol/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_2_edge/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_2_enable/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_2_isel_0/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_2_isel_1/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_2_isel_2/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_2_isel_3/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_2_isel_4/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_2_pol/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_3_edge/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_3_enable/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_3_isel_0/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_3_isel_1/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_3_isel_2/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_3_isel_3/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_3_isel_4/DFF/CK coreinst/ks_core1/amba_dsp1/mcore0/ioport0/r_reg_iconf_3_pol/DFF/CK

##############################################
# 3. find cells which have U in their instance name
get_cells *U* -hierarchical

@innovus 4> get_cells *U* -hierarchical
coreinst/ks_core1/periph1_PH/amba_usb1/usb1/u1/u3/pid_OUT_r_reg coreinst/ks_core1/periph1_PH/amba_usb1/usb1/u1/u3/pid_SETUP_r_reg coreinst/ks_core1/periph1_PH/amba_usb1/AmbaWbWrapper_DUT coreinst/ks_core1/periph1_PH/des_top1/des_top_inst/AHBSlaveIF/OUTfifoRead_reg coreinst/ks_core1/periph1_PH/des_top1/des_top_inst/controller/OUTfifoWrite_reg_reg coreinst/ks_core1/periph1_PH/des_top1/des_top_inst/OUTfifo


##############################################
# 4. find all cells which have OR2 in their base_name
get_cells *OR2* -hierarchical

@innovus 9> get_cells *OR2*
**WARN: (TCLCMD-513):   The software could not find a matching object of the specified type for the pattern '*OR2*'
**ERROR: (TCLCMD-917):  Cannot find 'cells' that match '*OR2*'

##############################################
# 5. find all ports which are in layer M13
get_ports [dbGet *M13*]
