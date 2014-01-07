# Cubic permutations
# 
# Problem 62
# 
# The cube, 41063625 (345 ** 3), can be permuted to produce two other cubes: 
# 56623104 (384 ** 3) and 66430125 (405 ** 3). In fact, 41063625 is the smallest cube which 
# has exactly three permutations of its digits which are also cube.
# 
# Find the smallest cube for which exactly five permutations of its digits are cube.


require_relative 'euler_methods.rb'


def euler62(n, no_of_perms)
  no_of_digits = 1
  cubes_array = []
  
  1.upto(n) do |i|
    cube = i ** 3
#   reset the array each time the number of digits changes (optimisation)  
    if cube.to_s.length > no_of_digits
      cubes_array = []
      no_of_digits = cube.to_s.length
    end
    count = 1
    perms = [cube]
    cubes_array.each do |j|
      if permutation?(cube, j)
        puts "check #{cube}"
        puts j
        count += 1
        perms << j
        if count >= no_of_perms
          return perms.sort[0] # returns smallest of the cubes
        end
      end
    end
    cubes_array << cube
  end
end


n = 1000000			# number to iterate up to
no_of_perms = 5		# variable for number of permutations needed

answer = euler62(n, no_of_perms) 

puts "The answer to Project Euler problem 62 is #{answer}."

