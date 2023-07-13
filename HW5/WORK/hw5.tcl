### NOTICE READ THE PARTS ASNWERS BELOW, FOLLOWING PART HAS MANY PROC FUNCTIONS THAT ARE BEING USED FOR THE ALGORITHM.

######################### 
#
# return max of a, b
#
proc return_max { a b} {
    set max [expr max($a,$b)]
    return $max
}


######################### 
#
# return min of a, b
#
proc return_min { a b } {
    set min [expr min($a,$b)]
    return $min
}


######################### 
#
# returns a list of root
# objects of all MX2X1 
# instances the design. 
#
proc return_mux_list {} {
    set mux_list {}
    foreach inst [get_db insts] { 
	if { [get_db $inst .base_cell.name] == "MX2X1" } { 
	    lappend mux_list $inst
	    #puts [get_db $inst .name]
	    #puts $mux_list
	}
    }
    return $mux_list
}


######################### 
#
# returns a list of root
# objects of all a, b, z 
# nets the design. 
#
proc return_net_list {} {
    set net_list {}
    foreach net [get_db [get_nets] == *a* ] { lappend net_list $net }
    foreach net [get_db [get_nets] == *b* ] { lappend net_list $net }
    foreach net [get_db [get_nets] == *z* ] { lappend net_list $net }
    return $net_list
}


######################### 
#
# calc and return overlap
# between two cells
#
proc return_overlapping_area { cell_a cell_b } {
    #
    # cell a boundary
    set a_x_left   [get_db $cell_a .bbox.ll.x]
    set a_y_left   [get_db $cell_a .bbox.ll.y]
    set a_x_right  [get_db $cell_a .bbox.ur.x]
    set a_y_right  [get_db $cell_a .bbox.ur.y]
    #
    # cell b boundary
    set b_x_left   [get_db $cell_b .bbox.ll.x]
    set b_y_left   [get_db $cell_b .bbox.ll.y]
    set b_x_right  [get_db $cell_b .bbox.ur.x]
    set b_y_right  [get_db $cell_b .bbox.ur.y]
    #
    set left   [return_max $a_x_left $b_x_left]
    set right  [return_min $a_x_right $b_x_right]
    set top    [return_max $a_y_left $b_y_left]
    set bottom [return_min $a_y_right $b_y_right]
    #
    set overlap [expr [return_max 0.0 [expr $right-$left]]*[return_max 0.0 [expr $bottom-$top]]]
    return $overlap
}


######################### 
#
# return area of cells 
# outside the floorplan 
# bounding box
#
proc return_cell_area_outside_boundry { input_inst_list input_top_design } {
    set sum 0.0
    set sum2 0.0
    foreach inst $input_inst_list {
	set inst_area [get_db $inst .area]
	set overlap_area [return_overlapping_area $input_top_design $inst]
	set sum2 $sum
	set sum [expr $sum2 - $inst_area + $overlap_area] 
    }
    return $sum
}


######################### 
#
# return overlap area of 
# a given cell list 
#
proc return_total_overlap { input_inst_list } {
    set sum 0.0
    set sum2 0.0
    foreach inst1 $input_inst_list {
	set cell_area [get_db $inst1 .area]
	foreach inst2 $input_inst_list {
	    set overlap_area [return_overlapping_area $inst1 $inst2]
	    set sum2 $sum
	    set sum [expr $sum2 + $overlap_area] 
	}
	set sum2 $sum
	set sum [expr $sum2 - $cell_area] 
    }
    return [expr $sum/2]
}


######################### 
#
# return the manhattan 
# wirelength of a list
# of nets
#
proc return_total_manhattan_wirelength { input_net_list } {
    set sum 0.0
    set sum2 0.0
    foreach net $input_net_list {
	set net_dx [get_db $net .wires.rect.dx]
	set net_dy [get_db $net .wires.rect.dy]
	foreach cord_val_dx $net_dx {
	    set sum2 $sum
	    set sum [expr $sum2 + $cord_val_dx] 
	}
	foreach cord_val_dy $net_dy {
	    set sum2 $sum
	    set sum [expr $sum2 + $cord_val_dy] 
	}
    }
    return [expr $sum]
}


######################### 
#
#
#
proc Weight { } {
    set top_design    [get_db designs]
    set mux_inst_list [return_mux_list ]
    set net_list      [return_net_list]
    set sum 0.0    
    set out_boundry  [return_cell_area_outside_boundry $mux_inst_list $top_design]
    
    # HW5 modification
    # Iterative approach O(N*N)
    set overlap_area [return_total_overlap $mux_inst_list]
    # Segment Tree approach O(N*log(N))
    # set overlap_area [overlapping_area_with_segment_tree $mux_inst_list]
    
    set wirelength   [return_total_manhattan_wirelength $net_list]
    set sum [expr $out_boundry + $wirelength + $overlap_area] 
    return [expr $sum]
}


######################### 
#
#
# 
proc random { min max } {
    set random [expr {int(rand() * ($max + 1 - $min)) + $min}]
    return $random
}


######################### 
#
#
# 
proc shuffle_initial_floorplan { inst_list } {
    set x_min [get_db designs .bbox.ll.x]
    set x_max [get_db designs .bbox.ur.x]
    set y_min [get_db designs .bbox.ll.y]
    set y_max [get_db designs .bbox.ur.y]
    foreach inst $inst_list {
	set x_offset [expr [random $x_min $x_max]/2]
	set y_offset [expr [random $y_min $y_max]/2]
	move_inst $inst $x_offset $y_offset
	#set x_rand [random $x_min $x_max]
	#set y_rand [random $y_min $y_max]
	#place_inst $inst $x_rand $y_rand R0 -placed	
    }
    route_design
} 


######################### 
#
# M1 stage
# 
proc move_inst { inst_list x_offset y_offset } {
    # pick random instance
    set inst_num [random 0 [expr [llength $inst_list]-1]]
    set instance [lindex $inst_list $inst_num]
    # get x/y coordinates
    set x_cord [get_db $instance .bbox.ll.x]
    set y_cord [get_db $instance .bbox.ll.y]		
    #
    # needs adjustments
    set new_x [expr $x_cord + $x_offset]
    set new_y [expr $y_cord + $y_offset]
    #
    place_inst $instance $new_x $new_y R0 -placed
    set overlap []
    
    #route_design
}


######################### 
#
# M2 stage
# 
proc interchange_insts { inst_list } {
    set track_hight 2.61
    #
    # pick 2 insts randomly
    set inst_1_num [random 0 [expr [llength $inst_list]-1]]
    set inst_2_num [random 0 [expr [llength $inst_list]-1]]
    set inst1 [lindex $inst_list $inst_1_num]
    set inst2 [lindex $inst_list $inst_2_num]
    #
    # get insts coordinates for swaping
    set inst_1_x [get_db $inst1 .bbox.ll.x]
    set inst_1_y [get_db $inst1 .bbox.ll.y]
    set inst_2_x [get_db $inst2 .bbox.ll.x]
    set inst_2_y [get_db $inst2 .bbox.ll.y]
    #
    # swap locations of insts
    place_inst $inst1 $inst_2_x $inst_2_y R0 -placed
    place_inst $inst2 $inst_1_x $inst_1_y R0 -placed    
    # route_design
}


######################### 
#
# choose move between M1 and M2.
# 
proc take_move { inst_list temp } {
    set m1_probability 0.8
    set probability [random 0.0 1.0]
    if { $probability < $m1_probability } {
	set max_width [expr $temp/2]
	set max_hight [expr $temp/2]
	set x_offset [random [expr -$max_width/2] [expr $max_width/2]]
	set y_offset [random [expr -$max_hight/2] [expr $max_hight/2]]
	move_inst $inst_list $x_offset $y_offset
    } else {
	interchange_insts $inst_list
    }
    route_design
}


######################### 
#
# update teperature.
# 
proc update_temp { temp } {
    set t_slow_decay 0.95
    set t_fast_decay 0.92
    set t_trans_to_slow 60
    if { $temp > $t_trans_to_slow } {
	return [expr $temp*$t_fast_decay]
    } else {
	return [expr $temp*$t_slow_decay]
    }    
}


######################### 
#
# save current x floorplan.
# 
proc return_x_insts_positions { inst_list } {
    set pos_list []
    foreach inst $inst_list {
	set x_pos [get_db $inst .bbox.ll.x]
	lappend pos_list $x_pos
    }
    return $pos_list
}


######################### 
#
# save current y floorplan.
# 
proc return_y_insts_positions { inst_list } {
    set pos_list []
    foreach inst $inst_list {
	set y_pos [get_db $inst .bbox.ll.y]
	lappend pos_list $y_pos
    }
    return $pos_list
}


######################### 
#
# retrieve floorplan.
# 
proc retrieve_previose_floorplan { inst_list x_pos_list y_pos_list } {
    set index 0
    foreach inst $inst_list {
	set x_prev_pos [expr [lindex $x_pos_list $index] + 0.0]
	set y_prev_pos [expr [lindex $y_pos_list $index] + 0.0]
	#puts "-I- Placing inst: $inst, X pos: $x_prev_pos, Y pos: $y_prev_pos, Index: $index"  
	place_inst $inst $x_prev_pos $y_prev_pos R0 -placed	
	set index [expr $index + 1]
    }
    route_design
}


######################### 
#
# return metropolis function.
# TODO calibrate boltzman const
proc return_metropolis_function { curr_weight new_weight temp } {
    set boltzman_const 0.1
    set diff [expr $new_weight - $curr_weight]
    return [expr exp([expr -$diff/[expr $temp*$boltzman_const]])]
}


######################### 
#
# update teperature.
# 
proc timberwolf_placement {} {
    place_design
    puts "-I- ******** Starting Timberwolf Placement Algorithm ********"
    # set initial temp constants.
    set t0 90
    set t_freeze 30
    set temp $t0
    #
    # set K iterations and N modules.
    set K 1
    set mux_list [return_mux_list]
    set N [llength $mux_list]
    #
    # set initial solution
    shuffle_initial_floorplan $mux_list    
    shuffle_initial_floorplan $mux_list    
    shuffle_initial_floorplan $mux_list    
    set iteration 0
    #
    while {$temp > $t_freeze} {	
	set weight [Weight]
	set iteration [expr $iteration+1]
	puts "-I- Iteration: $iteration, Temperature: $temp, Weight: $weight"
	#
	# generate possible solutions
	for { set i 0 } { $i < [expr $N*$K] } { incr i } {
	    puts "-I- move: $i"
	    #
	    # save floorplan posisions.
	    set prev_x_positions [return_x_insts_positions $mux_list]
	    set prev_y_positions [return_y_insts_positions $mux_list]
	    #
	    # take move and set new cost
	    take_move $mux_list $temp
	    set new_weight [Weight]
	    #
	    # 
	    if { $new_weight > $weight } {
		#
		set metropolis [return_metropolis_function $weight $new_weight $temp]
		set criterion [return_min $metropolis 1.0]
		if { $criterion > [random 0.0 1.0] } {
		    set weight $new_weight
		    puts "-I- Take New design from metropolis"
		} else { 
		    puts "-I- Stay With Old design"
		    retrieve_previose_floorplan $mux_list $prev_x_positions $prev_y_positions
		    set weight [Weight]
		}
	    } else {
		set weight $new_weight 
		puts "-I- Take New design"
	    }
	}
	# update temp
	set temp [update_temp $temp]
    }
    puts "-I- Final Floorplan Weight: $weight"
}


########################################################################### 
#
########################## HW5 STARTS HERE ######################### 
# 
###########################################################################


######################### 
#
# 
# 
proc get_x_abscissa_list { inst_list } {
    set inst_left_list []
    foreach inst $inst_list {
	set x_pos_left [get_db $inst .bbox.ll.x]
	lappend inst_left_list [list $x_pos_left "left" $inst]
	set x_pos_right [get_db $inst .bbox.ur.x]
	lappend inst_left_list [list $x_pos_right "right" $inst]
    }
    return [lsort -real -index 0 $inst_left_list]
}


######################### 
#
# only lower nodes available 
# since mux height is only 1 track 
# no need for tree traversal 
proc build_empty_segment_tree {} {
    set N_tracks [expr {ceil([get_db designs .bbox.dy ]/2.61)}]
    set segment_tree_list []
    while {$N_tracks > 0} {
	lappend segment_tree_list 0.0
	set N_tracks [expr $N_tracks-1]
    }
    return $segment_tree_list
}


######################### 
#
# 
# 
proc insert_segment { tree_list segment_idx } {
    set val [lindex $tree_list $segment_idx]
    lset tree_list $segment_idx [expr $val+1.0]
    return $tree_list
}


######################### 
#
# 
# 
proc remove_segment { tree_list segment_idx } {
    set val [lindex $tree_list $segment_idx]
    if { [expr $val-1] >= 0} {
	lset tree_list $segment_idx [expr $val-1]
    } else {
    	lset tree_list $segment_idx 0
    }
    return $tree_list
}


######################### 
#
# 
# 
proc get_segment { tree_list segment_idx } {
    set val [lindex $tree_list $segment_idx]
    return $val
}


######################### 
#
# 
# 
proc overlapping_area_with_segment_tree { inst_list } {
    set segment_tree [build_empty_segment_tree]
    set scan_line_list [get_x_abscissa_list $inst_list] 
    set scan_idx 0
    set list_length [llength $scan_line_list]
    set inter_area 0.0

    set prev_scan_val [lindex [lindex $scan_line_list $scan_idx] 0] 	
    while { $scan_idx < $list_length } {
	set curr_scan_val  [lindex [lindex $scan_line_list $scan_idx] 0] 
       	set curr_scan_type [lindex [lindex $scan_line_list $scan_idx] 1]
	set curr_inst      [lindex [lindex $scan_line_list $scan_idx] 2]
	set dx             [expr $curr_scan_val - $prev_scan_val]
	set track_idx      [expr {ceil([get_db $curr_inst .bbox.ll.y]/2.61)}]
	set track_idx      [expr int($track_idx)]
	set inter_count    [get_segment $segment_tree $track_idx]
	if { $inter_count > 1 } {
	    set inter_count [expr $inter_count-1]
	} else {
	    set inter_count 0.0
	}
	set inter_area     [expr $inter_area + [expr [expr $inter_count * 2.61] * $dx]] 
		
	if { $curr_scan_type == "left" } {
	    set segment_tree [insert_segment $segment_tree $track_idx]
	} else {
	    set segment_tree [remove_segment $segment_tree $track_idx]
	}
	set prev_scan_val $curr_scan_val
	set scan_idx [expr $scan_idx+1]
    }
    return $inter_area 
}


##############################
### PART A
##############################
# >> puts "-I- Part A, find and print mux insts"
# >> set mux_inst_list [return_mux_list ]
# >> puts [get_db $mux_inst_list .name]


##############################
### PART B
##############################
# >> puts "-I- Part B, place design and calculate weight"
# >> place_design
# >> set weight [Weight]
# >> puts "-I- Weight of current design is: $weight"


##############################
### PART C
##############################
# >> puts "-I- Part C, Running timberwolf algorithm"
#    set t0 90
#    set t_freeze 25
#    set K 3
#    set boltzman_const 0.1
#    set t_slow_decay 0.96
#    set t_fast_decay 0.94
#    set t_trans_to_slow 60
# >> timberwolf_placement


##############################
### PART D
##############################
# >> puts "-I- Part D, run timberwolf with different number of muxes"
# set following params inside the proc
#    set t0 90
#    set t_freeze 30
#    set K 1
#    set boltzman_const 0.1
#    set t_slow_decay 0.95
#    set t_fast_decay 0.92
#    set t_trans_to_slow 60

# number of muxes = 5, rerun tcl

set now [clock seconds]
set timestr [clock format $now -format "%y-%m-%d %H:%M:%S"]
puts "-I- Time $timestr"
timberwolf_placement
set now [clock seconds]
set timestr [clock format $now -format "%y-%m-%d %H:%M:%S"]
puts "-I- Time $timestr"
set weight [Weight]
puts "-I- Weight of 5 mux design is: $weight"

# number of muxes = 10, rerun tcl
#set now [clock seconds]
#set timestr [clock format $now -format "%y-%m-%d %H:%M:%S"]
#puts "-I- Time $timestr"
#timberwolf_placement
#set now [clock seconds]
#set timestr [clock format $now -format "%y-%m-%d %H:%M:%S"]
#puts "-I- Time $timestr"
#set weight [Weight]
#puts "-I- Weight of 10 mux design is: $weight"


##############################
### PART E
##############################
# >> puts "-I- Part E, place design with 5 muxes and calculate weight"
# >> place_design
# >> set weight [Weight]
# >> puts "-I- Weight of place_design with 5 muxs is: $weight"

# The place_design will definatelly provide a better optimal solution from our solution since the cost function we are using is very minimal and does not contain as much constraints. also in our solution we are only trying to optimize the mux instances while the place_design command probably optimizes the whole design including ports. also place_design might be using a more sophisticated and tuned algorithm than what we are using. 
