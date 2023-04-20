#################
# Part 4 answers
#################

##############################################
# 1. Routing distance
# 
# in -> A1 : 0
# in -> A2 : 1
# in -> A3 : 2
# in -> A4 : 3
# in -> A5 : 4

# A1 -> B1 : 5
# A1 -> B2 : 6
# A1 -> B3 : 7
# A1 -> B4 : 8
# A1 -> B5 : 9

# A2 -> B1 : 4
# A2 -> B2 : 5
# A2 -> B3 : 6
# A2 -> B4 : 7
# A2 -> B5 : 8

# A3 -> B1 : 3
# A3 -> B2 : 4
# A3 -> B3 : 5
# A3 -> B4 : 6
# A3 -> B5 : 7

# A4 -> B1 : 2
# A4 -> B2 : 3
# A4 -> B3 : 4
# A4 -> B4 : 5
# A4 -> B5 : 6

# A5 -> B1 : 1
# A5 -> B2 : 2
# A5 -> B3 : 3
# A5 -> B4 : 4
# A5 -> B5 : 5

# B1 -> C1 : 5
# B2 -> C1 : 4
# B3 -> C1 : 3
# B4 -> C1 : 2
# B5 -> C1 : 1

# C1 -> OUT : 0
# TOTAL ROUNTING = 15+15+20+25+30+35+10 = 150 

##############################################
# 2. Routing distance
# IN -> A1 -> B1 -> A2 -> B2 -> A3 -> C1 -> B3 -> A4 -> B4 -> A5 -> B5
# the improvment cam from breaking long paths into short by swaping between units, we came to a permutation of pairs where each A is followed by B.

# in -> A1 : 0
# in -> A2 : 2
# in -> A3 : 4
# in -> A4 : 7
# in -> A5 : 9

# A1 -> B1 : 1
# A1 -> B2 : 3
# A1 -> B3 : 6
# A1 -> B4 : 8
# A1 -> B5 : 10

# A2 -> B1 : 1
# A2 -> B2 : 1
# A2 -> B3 : 4
# A2 -> B4 : 6
# A2 -> B5 : 8

# A3 -> B1 : 3
# A3 -> B2 : 1
# A3 -> B3 : 2
# A3 -> B4 : 4
# A3 -> B5 : 6

# A4 -> B1 : 6
# A4 -> B2 : 4
# A4 -> B3 : 1
# A4 -> B4 : 1
# A4 -> B5 : 3

# A5 -> B1 : 9
# A5 -> B2 : 7
# A5 -> B3 : 4
# A5 -> B4 : 2
# A5 -> B5 : 1

# B1 -> C1 : 4
# B2 -> C1 : 2
# B3 -> C1 : 1
# B4 -> C1 : 3
# B5 -> C1 : 5

# C1 -> OUT : 5
# TOTAL ROUNTING = 144 


##############################################
# 3. there is an optimal solution for the problem there might be more than one, the solution cant be achieved in polinomyal time since the worst time is N! if we use a greedy algorithim and the best time with an nlogn time using shortest path Graph algorithim starting from each node. 


##############################################
# 4. there probably still exists an optimal solution for the problem, but it might not be achievabale within a limited time.
