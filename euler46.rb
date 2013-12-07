# Goldbach's other conjecture
# 
# Problem 46
# 
# It was proposed by Christian Goldbach that every odd composite number can be written 
# as the sum of a prime and twice a square.
# 
# 9 = 7 + 2×12
# 15 = 7 + 2×22
# 21 = 3 + 2×32
# 25 = 7 + 2×32
# 27 = 19 + 2×22
# 33 = 31 + 2×12
# 
# It turns out that the conjecture was false.
# 
# What is the smallest odd composite that cannot be written as the sum of a prime 
# and twice a square?



require_relative 'euler_methods.rb'


def euler46(n)
  primes = primes_array(n)
  sum_of_prime_and_squares = []
  primes.each do  |i|
    1.upto(n) do |j|
      sum_of_prime_and_squares << i + 2 * (j ** 2)
    end
  end
  p sum_of_prime_and_squares.sort.uniq! # use this to verify simple cases
  starting_composite = 9
  (starting_composite..n).step(2) do |k|
    if primes.include?(k)
      next
    elsif sum_of_prime_and_squares.include?(k) == false
      return k
    end
  end
  
  false
end


# n is the upper limit of the primes, squares and the odd composites to check. needs
# to be adjusted so that it is high enough to reach the answer.
n = 10000

answer = euler46(n) 

puts "The answer to Project Euler problem 46 is #{answer}."