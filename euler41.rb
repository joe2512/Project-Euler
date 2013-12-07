# Pandigital prime
# 
# Problem 41
# 
# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 
# to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
# 
# What is the largest n-digit pandigital prime that exists?


require_relative 'euler_methods.rb'
require 'Prime'

puts Prime.prime?(51)

def euler41()
  highest = 0
  primes = primes_array(1000000000)
# Narrow the range down to the highest thousand.
  900000000.upto(999999999) do |i|
    if pan_digital?(i) and primes.include?(i) and i > highest
        highest = i
        puts i
    end
  end  
  highest  
end



answer = euler41() 

puts "The answer to Project Euler problem 41 is #{answer}."

## TAKES TOO LONG - need to optimise the is_prime? method