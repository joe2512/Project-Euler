# Summation of primes
# 
# Problem 10
# 
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# 
# Find the sum of all the primes below two million.


require_relative 'euler_methods.rb'


answer = primes_array(2000000).inject(:+)

print "The sum of the primes under two million is #{answer}."
