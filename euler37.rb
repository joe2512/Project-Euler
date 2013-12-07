# Truncatable primes
# 
# Problem 37
# 
# The number 3797 has an interesting property. Being prime itself, it is possible to 
# continuously remove digits from left to right, and remain prime at each stage: 3797, 
# 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
# 
# Find the sum of the only eleven primes that are both truncatable from left to right and 
# right to left.
# 
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

require_relative 'euler_methods.rb'


def truncatable_prime?(n)
  right = n.to_s
  left = n.to_s
  n.to_s.length.times do 
    if is_prime?(right.to_i) != true
      return false
    end
    right = right[0..-2]
  end
  n.to_s.length.times do 
    if is_prime?(left.to_i) != true
      return false
    end
    left = left[1..-1]
  end
  
  true
end

def euler37(n)
  sum = 0
# Start from 10 as 2,3,5,7 don't count.
  10.upto(n) do |i|
    if truncatable_prime?(i)
      puts i
      sum += i
    end
  end
  
  sum
end

      

# The value n is a speculation on how high to search for the answers.
n = 1000000

answer = euler37(n) 

puts "The answer to Project Euler problem 37 is #{answer}."

