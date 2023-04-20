######################################################
# 1. push and pop procedure
set mystack [list elem0 elem1 elem2] ;#initializing the stack as list

# push procedure
proc push {mystack a} {
	upvar 1 $mystack stack
	set stack [linsert $stack 0 $a]
}

# pop procedure
proc pop {mystack} {
	upvar 1 $mystack stack
	set popped [lindex $stack 0]
	set stack [lreplace $stack 0 0]
	puts $popped
}

###### VERIFICATION #######
# printing elements of the stack
puts "printing stack elements"
foreach c $mystack { 
	puts $c
}

puts "push elem4"
push mystack "elem4"
puts "push elem5"
push mystack "elem5"
puts "push elem6"
push mystack "elem6"

puts "printing stack elements"
foreach c $mystack {
	puts $c
}

puts "pop"
pop mystack
puts "pop"
pop mystack
puts "pop"
pop mystack
puts "pop"
pop mystack
puts "pop"
pop mystack
puts "pop"
pop mystack
puts "pop"
pop mystack

# testing if everything worked
puts "printing stack elements"
foreach c $mystack {
	puts $c
}


######################################################
# 2. Fibonnacci  A(1) = 1, A(2) = 2, A(n) = A(n-1) + C*A(n-2)
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

###### VERIFICATION #######
puts [FiboC 1 1]; # expected 1
puts [FiboC 2 1]; # expected 2
puts [FiboC 3 1]; # expected 3
puts [FiboC 4 1]; # expected 5
puts [FiboC 5 1]; # expected 8

puts [FiboC 1 2]; # expected 1
puts [FiboC 2 2]; # expected 2
puts [FiboC 3 2]; # expected 4
puts [FiboC 4 2]; # expected 8
puts [FiboC 5 2]; # expected 16


######################################################
# 3. matrix(nxn)--each element is Mij = i*j
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

###### VERIFICATION #######
puts [matrix 1]
puts [matrix 2]
puts [matrix 3]
puts [matrix 4]
puts [matrix 5]

######################################################
# 4. break list into array 
#initializing list of lists + printing elements
set myList {{1 1 3} {1 2 3 4} {0} {4 2}} 
foreach c $myList {
    puts  "$c "
}
#declaring empty array and printing elements
array set myArray {}
parray myArray
puts "\n----------------"

# breaking the list of lists into small list components and inserting the 
# elements into array 1 by 1
proc my_array_set {myArray mylist} {
    upvar 1 $mylist list
    upvar 1 myArray array
	set i 0
	foreach c $list {
	    foreach j $c {
	        set array($i) $j
		    incr i
	    }
	}
}

#checking if the proccess works
my_array_set myArray myList
parray myArray
