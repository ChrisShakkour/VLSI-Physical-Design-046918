# 1 push and pull procedure


#    PUSH
proc push {mystack a} {
	upvar 1 $mystack stack
	set stack [linsert $stack 0 $a]
}


#    POP
proc pop {mystack} {
	upvar 1 $mystack stack
	set popped [lindex $stack 0]
	set stack [lreplace $stack 0 0]
	puts $popped
}




# 2  FIBONNACI  A(1) = 1, A(2) = 2, A(n) = A(n-1) + C*A(n-2)

proc FiboC {n c} {
	set num1 1 ; #n-2
	set num2 2 ; #n-1
	
	if {$n < 2} {
	    return $n
	    
	} else {
		for { set i 3} {$i <= $n} {incr i} {
			set tmp [expr $num2+$c*$num1]
			set num1 $num2
			set num2 $tmp
			
		}
	}
	return $num2
}


# 3 matrix(nxn)--each element is Mij = i*j
proc matrix {n} {
	puts "my matrix is "
	for {set i 0} {$i < $n} {incr i} {
		for {set j 0} {$j < $n} {incr j} {
			set multi [expr $i*$j]
			puts -nonewline "$multi "
		}
		puts " "
	}
}


# 4 LIST OF LISTS ----> ARRAY
#breaking the list of lists into small list components and inserting the 
#elements into array 1 by 1
proc my_array_set {myArray mylist} {
    upvar 1 $mylist list
    #upvar 1 myArray array
	set i 0
	foreach c $list {
	    foreach j $c {
	        set array($i) $j
		    incr i
	    }
	}
}
