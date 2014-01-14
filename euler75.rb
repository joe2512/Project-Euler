# Singular integer right triangles
# 
# Problem 75
# 
# It turns out that 12 cm is the smallest length of wire that can be bent to form an 
# integer sided right angle triangle in exactly one way, but there are many more examples.
# 
# 12 cm: (3,4,5)
# 24 cm: (6,8,10)
# 30 cm: (5,12,13)
# 36 cm: (9,12,15)
# 40 cm: (8,15,17)
# 48 cm: (12,16,20)
# 
# In contrast, some lengths of wire, like 20 cm, cannot be bent to form an integer 
# sided right angle triangle, and other lengths allow more than one solution to be 
# found; for example, using 120 cm it is possible to form exactly three different 
# integer sided right angle triangles.
# 
# 120 cm: (30,40,50), (20,48,52), (24,45,51)
# 
# Given that L is the length of the wire, for how many values of L ≤ 1,500,000 can 
# exactly one integer sided right angle triangle be formed?


require_relative 'euler_methods.rb'


def euler75(n)
  trips = pythag_triples(n)
  perimeters = {}
  trips.each do |i|
    current = i.split(",").inject{|sum, j| sum.to_i + j.to_i}
    i = 1
    while true
      nth = i * current
      puts nth
      if perimeters.include?(nth)
        perimeters[nth] += 1
      else
        perimeters[nth] = 1
      end
      i += 1
      if nth > 1500000 then break end
    end
  end
  
  count = 0
  perimeters.each_key do |key|
    if perimeters[key] == 1 and key < 1500000
      count += 1
    end
  end
  count
end


n = 200000

answer = euler75(n) 

puts "The answer to Project Euler problem 75 is #{answer}."

