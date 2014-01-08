# Powerful digit counts
# 
# Problem 63
# 
# The 5-digit number, 16807=7 ** 5, is also a fifth power. Similarly, the 
# 9-digit number, 134217728=8 ** 9, is a ninth power.
# 
# How many n-digit positive integers exist which are also an nth power?


require_relative 'euler_methods.rb'


def euler63(n)
  count = 0
  
  1.upto(n) do |i|
    j = 0
#   this loop checks for j = 1 until it is too big whether the length of i ** j equals j  
    while
      j += 1
      if (i ** j).to_s.length == j
        puts (i ** j).to_s.length
        count += 1
      elsif (i ** j).to_s.length < j
        break
      end
    end
  end
  count
end


# no number n >= 10 can fulfill the criteria so we iterate from 1-9
n = 9 

answer = euler63(n) 

puts "The answer to Project Euler problem 63 is #{answer}."

