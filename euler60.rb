# Prime pair sets
# 
# Problem 60
# 
# The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes and 
# concatenating them in any order the result will always be prime. For example, taking 
# 7 and 109, both 7109 and 1097 are prime. The sum of these four primes, 792, represents 
# the lowest sum for a set of four primes with this property.
# 
# Find the lowest sum for a set of five primes for which any two primes concatenate to 
# produce another prime.

###
###  Attempted brute force solution. FAR too slow even for example. Not currently working.
###

require_relative 'euler_methods.rb'


def euler60(n)
  primes = primes_array(n)
  size = primes.size
  
  (1..size).each do |i|
#     primes[i]
    (i..size).each do |j|
#       primes[j]
      (j..size).each do |k|
#         primes[k]
        (k..size).each do |l|
#           primes[l]
          puts "a"
        end
      end
    end
  end
end


n = 600

answer = euler60(n) 

puts "The answer to Project Euler problem 60 is #{answer}."

