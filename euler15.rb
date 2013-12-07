# Lattice paths
# 
# Problem 15
# 
# Starting in the top left corner of a 2×2 grid, and only being able to move to the 
# right and down, there are exactly 6 routes to the bottom right corner.
# 
# 
# How many such routes are there through a 20×20 grid?


require_relative 'euler_methods.rb'


def euler15(n)
  square_paths(n)
end


# n is the size of the n x n square grid
n = 20

answer = euler15(n) 

puts "The answer to Project Euler problem 15 is #{answer}."


####
#### SLOW
####