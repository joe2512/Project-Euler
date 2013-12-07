require_relative 'euler_methods.rb'


## Finds the number of unique terms of the form a ** b for 2 <= a, b <= n.

def euler29(n)
  terms = []
  2.upto(n) do |i|
    2.upto(n) do |j|
      if terms.include?(i ** j) == false
        terms << i ** j
      end
    end
  end
  
  terms.length
end


n = 100

answer = euler29(n) 

puts "The answer to Project Euler problem 29 is #{answer}."