# Counting fractions
# 
# Problem 72
# 
# Consider the fraction, n/d, where n and d are positive integers. If n<d and HCF(n,d)=1, 
# it is called a reduced proper fraction.
# 
# If we list the set of reduced proper fractions for d ≤ 8 in ascending order of size, we get:
# 
# 1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8
# 
# It can be seen that there are 21 elements in this set.
# 
# How many elements would be contained in the set of reduced proper fractions for 
# d ≤ 1,000,000?

###
###
###		Currently DOESN'T WORK because it is too slow.
###
###


require_relative 'euler_methods.rb'


def euler72(n)
  count = 0
# works through three values just below 3/7 for each i (1 to 1,000,000)
  1.upto(n) do |denominator|
    puts denominator
    catch (:done) do
      1.upto(denominator - 1) do |numerator|
        [2,3,5,7,11,13,17,19,23].each do |i|
          if numerator % i == 0 and denominator % i == 0
    		throw :done
	      end
	    end
#       if numerator >= denominator then next end
#       puts "#{numerator} / #{denominator}"      
        if greatest_common_divisor(numerator, denominator) == 1
      	  count += 1
	    end
	  end
	end
  end
  count
end


n = 1000000

answer = euler72(n) 

puts "The answer to Project Euler problem 72 is #{answer}."

