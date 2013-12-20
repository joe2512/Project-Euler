# Combinatoric selections
# 
# Problem 53
# 
# There are exactly ten ways of selecting three from five, 12345:
# 
# 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345
# 
# In combinatorics, we use the notation, 5C3 = 10.
# 
# In general,
# 
# nCr =	  n!
#        r!(n−r)!       ,where r ≤ n, n! = n×(n−1)×...×3×2×1, and 0! = 1.
#        
# It is not until n = 23, that a value exceeds one-million: 23C10 = 1144066.
# 
# How many, not necessarily distinct, values of  nCr, for 1 ≤ n ≤ 100, are greater 
# than one-million?


require_relative 'euler_methods.rb'


def euler53(n, m)
  count = 0
  1.upto(n) do |i|
    1.upto(i) do |j|
      if binomial_coefficient(i, j) > m
        count += 1
      end
    end
  end
  count
end


n = 100 		# Specified in question.
m = 1000000		# Specified in question.

answer = euler53(n, m) 

puts "The answer to Project Euler problem 53 is #{answer}."

