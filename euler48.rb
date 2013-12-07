# Self powers
# 
# Problem 48
# 
# The series, 11 + 22 + 33 + ... + 1010 = 10405071317.
# 
# Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.


require_relative 'euler_methods.rb'


def euler48(n)
	big_number = 0
	1.upto(n) do |i| 
	  big_number += i ** i
	end
	puts big_number
	big_number.to_s[-10..-1]
end

# value for n is given in problem.
n = 1000

answer = euler48(n) 

puts "The answer to Project Euler problem 48 is #{answer}."