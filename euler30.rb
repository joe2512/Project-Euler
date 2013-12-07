require_relative 'euler_methods.rb'


# Put question here.
## NB Need to estimate n to find all numbers of this form that exist.
## 1,000,000 solves the problem.

def euler30(n)
  sum = 0
  2.upto(n) do |i|
    if sum_digit_power(i, 5) == i
      p i
      sum += i
    end
  end
  
  sum 
end


n = 1000000

answer = euler30(n) 

puts "The answer to Project Euler problem 30 is #{answer}."