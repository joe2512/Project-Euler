require 'euler_methods.rb'

#
#
#
#
#
#

def longest_collatz(n)
  longest = 0
  longest_number = 0
  
  for i in (1..n)
    puts i
    a = number_collatz(i)
    if a > longest
      longest = a
      longest_number = i
    end
  end
  
  longest_number
end

m = 1000000

answer = longest_collatz(m)

puts "The starting number that generates the 
      most number of terms in a Collatz sequence 
      under #{m} is #{answer}."

## Solution is found in about a minute.