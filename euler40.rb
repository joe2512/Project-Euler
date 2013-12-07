# Champernowne's constant
# 
# Problem 40
# 
# An irrational decimal fraction is created by concatenating the positive integers:
# 
# 0.123456789101112131415161718192021...
# 
# It can be seen that the 12th digit of the fractional part is 1.
# 
# If dn represents the nth digit of the fractional part, find the value of the following 
# expression.
# 
# d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000


require_relative 'euler_methods.rb'


def euler40(n, p)
  a = list_of_integers(n)
  spec = 1
  product = 1
  (1..p).each do |i|
    product *= a[spec - 1].to_i
    puts "product is #{product} and thing is #{a[spec - 1]}"
    spec *= 10
  end
  product
end


n = 1000000
# p = 7 gives powers of ten up to 1000000
p = 7

answer = euler40(n, p) 

puts "The answer to Project Euler problem 40 is #{answer}."

