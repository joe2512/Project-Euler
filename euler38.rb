# Pandigital multiples
# 
# Problem 38
# 
# Take the number 192 and multiply it by each of 1, 2, and 3:
# 
# 192 × 1 = 192
# 192 × 2 = 384
# 192 × 3 = 576
# By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 
# 192384576 the concatenated product of 192 and (1,2,3)
# 
# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, 
# giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).
# 
# What is the largest 1 to 9 pandigital 9-digit number that can be formed as the 
# concatenated product of an integer with (1,2, ... , n) where n > 1?

require_relative 'euler_methods.rb'


def pandigital_concat(n)
  concat = ""
# Returns the only possible pandigital concatenation. Returns false if not possible.
  2.upto(9) do |i|
    (1..i).each do |j|
      concat += (n * j).to_s
      if concat.length == 9 and pan_digital?(concat)
        return concat
      elsif concat.length > 9
        next
      end
    end
  end
  
  false
end


def euler38(m)
  highest = 0
  1.upto(m) do |i|
    a = pandigital_concat(i)
    if a == false
      next
    elsif a.to_i > highest
      puts a, i
      highest = a.to_i
    end
  end
  
  highest
end 


# Anything over 10000 would result in the concatenation being 10 digits at the least.
m = 10000

answer = euler38(m) 

puts "The answer to Project Euler problem 27 is #{answer}."

