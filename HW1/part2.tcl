#################
# Part 2 answers
#################

#################################################
# 1. Returns a collection of pins, ports or cells that exist in the fanout cone of ref_clk.
all_fanout -from [get_ports ref_clk] 


#################################################
# 2. Returns a collection of register output pins clocked by test_clk.
all_registers -output_pins -clock [get_clocks test_clk]


#################################################
# 3. Returns a collection of all instances of athe specified design xell FIR_filter_1 in the current design.
all_instances [get_design FIR_filter_1]


#################################################
# 4. Reports all of the properties associated with rst port.
report_property [get_ports rst]


#################################################
# 5. Returns the forth port out of all the ports in the design.
index_collection [get_ports *] 4


#################################################
# 6. Returns a collection of all instances in the current design only.
get_cells *


#################################################
# 7. Returns a collection of all instances in the current design heirarchialy (in all design).
get_cells * -hierarchical


#################################################
# 8. Creates a collection of instances in the current design whose name matches "AO1/add_94_37_I2/g703".
get_cells AO1/add_94_37_I2/g703


#################################################
# 9. Returns the area of all cells matching "AO1/add_94_37_I2/g703".
get_property [get_cells AO1/add_94_37_I2/g703] area


#################################################
# 10. Returns the name, pin count and library cell name of all instances whos pin count is larger than 3 under heirarchial paths only.
foreach_in_collection inst_C [filter_collection [get_cells * -hierarchical] {pin_count > 3 && is_hierarchical == true}] {
 set name [ get_property $inst_C name ]
 set count [ get_property $inst_C pin_count ]
 set cell [ get_property $inst_C ref_lib_cell_name ]
 puts "$name $count $cell"
}


#################################################
# 11. Returns the priod of ref_clk. 
get_property [ get_clocks ref_clk ] period


#################################################
# 12. Returns the heirarchial scope of every input clock pin of all instances matching DFF in the design (flip-flops).
foreach_in_collection pin_C [filter_collection [ get_lib_pins DFF*/* ] {direction == in
&& is_clock == true}] {
 puts [ get_property $pin_C hierarchical_name ]
}
