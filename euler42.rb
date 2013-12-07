# Coded triangle numbers
# 
# Problem 42
# 
# The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first 
# ten triangle numbers are:
# 
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
# 
# By converting each letter in a word to a number corresponding to its alphabetical 
# position and adding these values we form a word value. For example, the word value for 
# SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall 
# call the word a triangle word.
# 
# Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing 
# nearly two-thousand common English words, how many are triangle words?

require_relative 'euler_methods.rb'


def euler42()
# Readies the triangle numbers to be checked against.
  a = triangle_array(1000)
# Opens the file and puts all the words in an usable array.
  names = File.open('words.txt', 'r') { |file| file.gets.split(",") }
  names.map! {|i| i.gsub('"', '')}
  names.map! {|i| i.gsub('/', '')}
  count = 0
  names.each do |i|
     if a.include?(alphabet_value(i))
       puts i # lists all the words
       count += 1
     end
  end
  
  count
end


answer = euler42() 

puts "The answer to Project Euler problem 42 is #{answer}."