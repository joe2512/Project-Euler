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
    while j < 50
      j++
      puts j
    end
  end
  count
end


n = 1000

answer = euler63(n) 

puts "The answer to Project Euler problem 63 is #{answer}."

