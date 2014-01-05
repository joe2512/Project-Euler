# Powerful digit sum
# 
# Problem 56
# 
# A googol (10100) is a massive number: one followed by one-hundred zeros; 100100 is 
# almost unimaginably large: one followed by two-hundred zeros. Despite their size, 
# the sum of the digits in each number is only 1.
# 
# Considering natural numbers of the form, ab, where a, b < 100, what is the maximum 
# digital sum?


require_relative 'euler_methods.rb'


def euler56(n, m)
  greatest = 0
  
  m.upto(n) do |i|
    m.upto(n) do |j|
      number = i ** j
      if digit_sum_of(number) > greatest
        greatest = digit_sum_of(number)
      end
    end
  end
  
  greatest
end

# m and n is the range iterated over, should be from 1 to 99 but this will be optimised.
# SOLVED did not need to optimise.
m = 1
n = 99

answer = euler56(n, m) 

puts "The answer to Project Euler problem 56 is #{answer}."

