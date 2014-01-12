# Counting fractions in a range
# 
# Problem 73
# 
# Consider the fraction, n/d, where n and d are positive integers. If n<d and HCF(n,d)=1, 
# it is called a reduced proper fraction.
# 
# If we list the set of reduced proper fractions for d ≤ 8 in ascending order of size, 
# we get:
# 
# 1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8
# 
# It can be seen that there are 3 fractions between 1/3 and 1/2.
# 
# How many fractions lie between 1/3 and 1/2 in the sorted set of reduced proper fractions 
# for d ≤ 12,000?


require_relative 'euler_methods.rb'


def euler73(n, lower, upper)
  count = 0
  
# works through three values just below 3/7 for each i (1 to 1,000,000)
  1.upto(n) do |denominator|
    lower_limit = (denominator * lower - 1).to_i
    upper_limit = (denominator * upper + 1).to_i
    if lower_limit < 1 then lower_limit = 1 end
    lower_limit.upto(upper_limit) do |numerator|
      current = numerator / denominator.to_f   
      if current < upper and current > lower
        if greatest_common_divisor(numerator, denominator) == 1
      	  count += 1
	    end
	  end
	end
  end
  count
end


n = 12000
upper = 1 / 2.0
lower = 1 / 3.0

answer = euler73(n, lower, upper) 

puts "The answer to Project Euler problem 73 is #{answer}."