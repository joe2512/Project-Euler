# Digit factorials
# 
# Problem 34
# 
# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
# 
# Find the sum of all numbers which are equal to the sum of the factorial of their 
# digits.
# 
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

require_relative 'euler_methods.rb'


def euler34(n)
  sum = 0
  
# Counts from 10 as 1-9 would not be a sum. 
  10.upto(n) do |i|
    if sum_of_dig_factorial(i) == i
      puts i
      sum += i
    end
  end
  
  sum
end

# n is an estimate as the number to iterate up to.
n = 1000000

answer = euler34(n) 

puts "The answer to Project Euler problem 34 is #{answer}."