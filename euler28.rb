require_relative 'euler_methods.rb'


# Calculates the corner values of a linear number spiral.

def euler28(n)
  count = 0
  jump = 2
  nth_jump = 0
  value = 1
  
  1.upto((n - 1) * 2 + 1) do |i|
    count += value
    if nth_jump == 4
      jump += 2
      nth_jump = 0 
    end
    value += jump
    nth_jump += 1
    
    p value
  end
  
  count
end

n = 1001

answer = euler28(n) 

puts "The answer to Project Euler problem 28 is #{answer}."