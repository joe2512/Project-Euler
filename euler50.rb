# Consecutive prime sum
# 
# Problem 50
# 
# The prime 41, can be written as the sum of six consecutive primes:
# 
# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.
# 
# The longest sum of consecutive primes below one-thousand that adds to a prime, 
# contains 21 terms, and is equal to 953.
# 
# Which prime, below one-million, can be written as the sum of the most consecutive 
# primes?


require_relative 'euler_methods.rb'


def euler50(n, e)
  highest = 0
  limit = n
  consecutive_count = 0
  primes = primes_array(n)
  e.upto(e + 1000) do |i|
    puts "i is #{i}"
    primes.length.times do |j|
        current = primes[j..(j + i)].inject(:+)
#         puts "current is #{current}"
#         puts "primes is #{primes[j..(j + i)]}"
        puts i
        if is_prime?(current) and primes[j..(j + i)].length > consecutive_count and current < limit
          highest = current
          consecutive_count = i
          puts "#{highest} high and consec c  is #{consecutive_count}"
        end
    end
  end
  
  highest
end


# n is maximum number for the prime given in the question
n = 1000000
# e is an estimate for the length of the sequence
e = 470

answer = euler50(n, e) 

puts "The answer to Project Euler problem 50 is #{answer}."