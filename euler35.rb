# Circular primes
# 
# Problem 35
# 
# The number, 197, is called a circular prime because all rotations of the digits: 197,
# 971, and 719, are themselves prime.
# 
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79,
# and 97.
# 
# How many circular primes are there below one million?

require_relative 'euler_methods.rb'


# Finds the number of circular primes up to n.

def euler35(n)
  count = 0
  primes_array(n).each do |i|
    if prime_is_circular?(i) then count += 1 and puts i end
  end
  
  count
end


n = 1000000

answer = euler35(n) 

puts "The answer to Project Euler problem 35 is #{answer}."