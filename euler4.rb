# Largest palindrome product
# 
# Problem 4
# 
# A palindromic number reads the same both ways. The largest palindrome made from the 
# product of two 2-digit numbers is 9009 = 91 × 99.
# 
# Find the largest palindrome made from the product of two 3-digit numbers.


require_relative 'euler_methods.rb'


def euler4(n, d)
  highest = 0
  n.downto(n - d) do |i|
    n.downto(n - d) do |j|
      current = i * j
      if palindromic?(current) and current > highest
        highest = current
      end
    end
  end
  if highest == 0 then return false end
  highest 
end

# n is the maximum asserted in the question.
n = 999
# d is the difference to iterate down from n.
d = 110

answer = euler4(n, d) 

puts "The answer to Project Euler problem 4 is #{answer}."