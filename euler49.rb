# Prime permutations
# 
# Problem 49
# 
# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 
# 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each 
# of the 4-digit numbers are permutations of one another.
# 
# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, 
# exhibiting this property, but there is one other 4-digit increasing sequence.
# 
# What 12-digit number do you form by concatenating the three terms in this sequence?


require_relative 'euler_methods.rb'


def euler49
  solutions = []
  1000.upto(9999) do |i|
    if is_prime?(i)
#       Needs to be i + 1 to prevent using the 3 same numbers as a solution.
      (i + 1).upto(9999) do |j|
        if permutation?(i, j) and is_prime?(j)
          k = j + (j - i)
          if permutation?(j, k) and is_prime?(k)
            solutions << [i, j, k]
          end
        end
      end
    end
  end

  solutions[1]
end



answer = euler49

puts "The answer to Project Euler problem 49 is #{answer}."