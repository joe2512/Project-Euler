# Digit canceling fractions
# 
# Problem 33
# 
# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting 
# to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by 
# cancelling the 9s.
# 
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
# 
# There are exactly four non-trivial examples of this type of fraction, less than one in 
# value, and containing two digits in the numerator and denominator.
# 
# If the product of these four fractions is given in its lowest common terms, find the value
# of the denominator.

require_relative 'euler_methods.rb'



def euler33_cancels_fractions(n)
  array = []
  10.upto(n) do |i|
    10.upto(n) do |j|
      if j >= i then next end
      i_kan = i.to_s.split("")
      j_kan = j.to_s.split("")
      if i_kan[1] == "0" 
        next
      elsif i_kan[1] == j_kan[1]
        next
      elsif i_kan[0] == i_kan[1] and j_kan[0] == j_kan[1]
        next
      elsif i_kan[1] == j_kan[0] and i_kan[0].to_i.to_f / j_kan[1].to_i == i.to_f / j
        array << i
        array << j
        puts i_kan[0], j_kan[1], i, j
      elsif i_kan[0] == j_kan[1] and i_kan[1].to_i.to_f / j_kan[0].to_i == i.to_f / j
        puts i_kan[1], j_kan[0], i, j
        array << [j, i]
      end
    end
  end
  p array
  array
end

def euler33(n)
  answer_array = euler33_cancels_fractions(n)
  a = answer_array.inject(1) {|product, i| product *= i[0]}  
  b = answer_array.inject(1) {|product, i| product *= i[1]}
  simplify_fraction([a, b])[1]
end

n = 99

answer = euler33(n) 

puts "The answer to Project Euler problem 33 is #{answer}."