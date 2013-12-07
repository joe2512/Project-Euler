# Integer right triangles
# 
# Problem 39
# 
# If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, 
# there are exactly three solutions for p = 120.
# 
# {20,48,52}, {24,45,51}, {30,40,50}
# 
# For which value of p ≤ 1000, is the number of solutions maximised?


require_relative 'euler_methods.rb'


def euler39(n, p)
  highest = 0
  highest_value = 0
  a = all_pythag_triples(n, p)
  1.upto(p) do |i|
    count = 0
    a.each do |j|
      if i == j.inject(:+)
        count += 1
      end
    end
  if count > highest
    highest = count
    highest_value = i
  end
  end
  
  highest_value
end


# n is the number of triples requested in the array, this value was calculated through
# trial and error to be enough to solve the problem

n = 1000
p = 1000

answer = euler39(n, p) 

puts "The answer to Project Euler problem 39 is #{answer}."

