# Square root convergents
# 
# Problem 57
# 
# It is possible to show that the square root of two can be expressed as an infinite 
# continued fraction.
# 
# √ 2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...
# 
# By expanding this for the first four iterations, we get:
# 
# 1 + 1/2 = 3/2 = 1.5
# 1 + 1/(2 + 1/2) = 7/5 = 1.4
# 1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
# 1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...
# 
# The next three expansions are 99/70, 239/169, and 577/408, but the eighth expansion, 
# 1393/985, is the first example where the number of digits in the numerator exceeds the 
# number of digits in the denominator.
# 
# In the first one-thousand expansions, how many fractions contain a numerator with 
# more digits than denominator?


require_relative 'euler_methods.rb'

    
def euler57(n)
  count = 0
  
  1.upto(n) do |i|
    fraction = continued_fraction(i, 2)
    puts fraction
    fraction_array = fraction.split("/")
    if fraction_array[0].length > fraction_array[1].length
      count += 1
    end
  end
  
  count
end


n = 1000

answer = euler57(n) 

puts "The answer to Project Euler problem 57 is #{answer}."

