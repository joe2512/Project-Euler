# Square root digital expansion
# 
# Problem 80
# 
# It is well known that if the square root of a natural number is not an integer, then 
# it is irrational. The decimal expansion of such square roots is infinite without any 
# repeating pattern at all.
# 
# The square root of two is 1.41421356237309504880..., and the digital sum of the first 
# one hundred decimal digits is 475.
# 
# For the first one hundred natural numbers, find the total of the digital sums of the 
# first one hundred decimal digits for all the irrational square roots.


require_relative 'euler_methods.rb'


def euler80(n)
  total = 0

  1.upto(n) do |i|
#   skips square numbers
    root = Math.sqrt(i)
    if root % 1 == 0 then next end
	puts i
#   uses square root by subtraction algorithm to find to 100 d.p.
	b = 5
	a = b * i
	loop do
	  if a >= b
	    a = a - b
	    b += 10
	  else
	    a *= 100
	    b = ((b - 5) * 10) + 5
	  end
	  if b.to_s.length > 200 	# 200 digits is a safe amount for the first 100 to be correct
# 	    puts b 
	    100.times do |j|
	      total += b.to_s[j].to_i
	      print b.to_s[j].to_i
 		end
 		puts "aaaaaaaaaaaaaaaa"
	    break
	  end
    end  
  end
  total
end

n = 100

answer = euler80(n) 

puts "The answer to Project Euler problem 80 is #{answer}."

