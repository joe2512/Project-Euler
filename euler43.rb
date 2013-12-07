# Sub-string divisibility
# 
# Problem 43
# 
# The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each 
# of the digits 0 to 9 in some order, but it also has a rather interesting sub-string 
# divisibility property.
# 
# Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the 
# following:
# 
# d2d3d4=406 is divisible by 2
# d3d4d5=063 is divisible by 3
# d4d5d6=635 is divisible by 5
# d5d6d7=357 is divisible by 7
# d6d7d8=572 is divisible by 11
# d7d8d9=728 is divisible by 13
# d8d9d10=289 is divisible by 17
# Find the sum of all 0 to 9 pandigital numbers with this property.


require_relative 'euler_methods.rb'


def euler43()
  sum = 0
# Gather the relevant primes in an array.
  first_primes = primes_array(18)
  (1000000000..9999999999).each do |i|
    puts i
    if pan_digital?(i, true)
      puts i
      (1..7).each do |j|
        if i.to_s[j+1..j+3].to_i % first_primes[j-1] != 0
          break
        end
      end
      puts i
      sum += i
    end
  end
    
  sum 
end



answer = euler43() 

puts "The answer to Project Euler problem 43 is #{answer}."