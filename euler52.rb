# Permuted multiples
# 
# Problem 52
# 
# It can be seen that the number, 125874, and its double, 251748, contain exactly the 
# same digits, but in a different order.
# 
# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the 
# same digits.


require_relative 'euler_methods.rb'


def euler52(n, t)
  1000.upto(n) do |i|
    if (i.to_s.length) != (i * t).to_s.length then next end
  	(t - 1).times do |j|
  	  if permutation?(i, i * (j + 2)) == false then break end
  	  puts i
  	  if j + 2 == t then return i end
  	end
  end
  return false
end

# n is an estimate
n = 10000000
# number of times to contain same digits
t = 6

answer = euler52(n, t) 

puts "The answer to Project Euler problem 52 is #{answer}."