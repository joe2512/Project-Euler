# Double-base palindromes
# 
# Problem 36
# 
# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
# 
# Find the sum of all numbers, less than one million, which are palindromic in base 10 
# and base 2.
# 
# (Please note that the palindromic number, in either base, may not include leading 
# zeros.)


require_relative 'euler_methods.rb'


def euler36(n)
  sum = 0
  1.upto(n) do |i|
    if palindromic?(i) and palindromic?(to_binary(i))
      puts i, to_binary(i)
      sum += i
    end
  end
  
  sum
end


n = 1000000

answer = euler36(n) 

puts "The answer to Project Euler problem 36 is #{answer}."

