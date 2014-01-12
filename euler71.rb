# Ordered fractions
# 
# Problem 71
# 
# Consider the fraction, n/d, where n and d are positive integers. If n<d and HCF(n,d)=1, 
# it is called a reduced proper fraction.
# 
# If we list the set of reduced proper fractions for d ≤ 8 in ascending order of size, 
# we get:
# 
# 1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8
# 
# It can be seen that 2/5 is the fraction immediately to the left of 3/7.
# 
# By listing the set of reduced proper fractions for d ≤ 1,000,000 in ascending order of 
# size, find the numerator of the fraction immediately to the left of 3/7.


require_relative 'euler_methods.rb'


def euler71(n, limit)
  closest_fraction = [0, 0]		# keep track of the current candidate for the answer
  closest_value = 0.0			# how close the current candidate is to limit (3/7)
  
# works through three values just below 3/7 for each i (1 to 1,000,000)
  1.upto(n) do |denominator|
    limit_minus = (denominator * limit - 1).to_i
    limit_minus.upto(limit_minus + 2) do |numerator|
      current = numerator / denominator.to_f      
      if current > closest_value and current < limit
		closest_fraction = [numerator, denominator]
		closest_value = current
	  end
	end
  end
  closest_fraction[0]
end


n = 1000000
limit = 3 / 7.0

answer = euler71(n, limit) 

puts "The answer to Project Euler problem 71 is #{answer}."

