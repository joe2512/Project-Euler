# Distinct primes factors
# 
# Problem 47
# 
# The first two consecutive numbers to have two distinct prime factors are:
# 
# 14 = 2 × 7
# 15 = 3 × 5
# 
# The first three consecutive numbers to have three distinct prime factors are:
# 
# 644 = 2² × 7 × 23
# 645 = 3 × 5 × 43
# 646 = 2 × 17 × 19.
# 
# Find the first four consecutive integers to have four distinct prime factors. What is 
# the first of these numbers?


require_relative 'euler_methods.rb'


def euler47(n)
  2.upto(n) do |i|
    combined_primes = []
    
#     Get the factors in an array and a unique array to simplify calculations later.
    one = prime_factors(i, true)
    two = prime_factors(i + 1, true)
    three = prime_factors(i + 2, true)
    four = prime_factors(i + 3, true)
	one_uniq = one.uniq 
    two_uniq = two.uniq
    three_uniq = three.uniq
    four_uniq = four.uniq
    
#     Check that each number has at least 4 distinct prime factors.
	if one_uniq.length < 4 or two_uniq.length < 4 or three_uniq.length < 4 or four_uniq.length < 4 then next end
	
#     Now can iterate over each unique element of one but multiply by the number of j's
    one_uniq.each {|j| combined_primes << j ** one.count(j)}
    two_uniq.each {|j| combined_primes << j ** two.count(j)}
    three_uniq.each {|j| combined_primes << j ** three.count(j)}
    four_uniq.each {|j| combined_primes << j ** four.count(j)}
    
    if combined_primes.uniq.length == combined_primes.length then return i end
  end
  false
end


n = 100000

answer = euler47(n) 

puts "The answer to Project Euler problem 47 is #{answer}."

# Doesn't work, too slow.