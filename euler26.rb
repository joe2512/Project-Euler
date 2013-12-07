require_relative 'euler_methods.rb'


def euler26(n)
  highest = 0
  highest_d = 0
  
  1.upto(n) do |i|
    current = rec_period("1/#{i}")
    if current > highest
      highest = current
      highest_d = i
    end
  end
  
  highest_d
end


n = 1000

answer = euler26(n) 

puts "The answer to Project Euler problem 26 is #{answer}."
