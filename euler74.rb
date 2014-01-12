# Digit factorial chains
# 
# Problem 74
# 
# The number 145 is well known for the property that the sum of the factorial of its 
# digits is equal to 145:
# 
# 1! + 4! + 5! = 1 + 24 + 120 = 145
# 
# Perhaps less well known is 169, in that it produces the longest chain of numbers that 
# link back to 169; it turns out that there are only three such loops that exist:
# 
# 169 → 363601 → 1454 → 169
# 871 → 45361 → 871
# 872 → 45362 → 872
# 
# It is not difficult to prove that EVERY starting number will eventually get stuck in a 
# loop. For example,
# 
# 69 → 363600 → 1454 → 169 → 363601 (→ 1454)
# 78 → 45360 → 871 → 45361 (→ 871)
# 540 → 145 (→ 145)
# 
# Starting with 69 produces a chain of five non-repeating terms, but the longest 
# non-repeating chain with a starting number below one million is sixty terms.
# 
# How many chains, with a starting number below one million, contain exactly sixty 
# non-repeating terms?


require_relative 'euler_methods.rb'


def euler74(n)
  count = 0
  
  1.upto(n) do |i|
    cycle = []
    current = sum_of_dig_factorial(i)
    
    while cycle.include?(current) == false
      cycle << current
      current = sum_of_dig_factorial(current)
    end
    
    if cycle.size == 59
      count += 1 
    end
  end
  count
end


n = 1000000

answer = euler74(n) 

puts "The answer to Project Euler problem 74 is #{answer}."

