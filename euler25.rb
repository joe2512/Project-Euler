require_relative 'euler_methods.rb'


# ## Finds the first fibonnaci term to contain n digits.

def euler25(n)
  n = 1
  until nth_fibonnaci(n).to_s.length >= 1000
    n += 1
    puts n
  end
  
  n 
end

criteria = 1000

# answer = euler25(criteria)

puts "The answer to Project Euler problem 25 is #{answer}."

## Not working because floats cannot have more than 300 digits, integers can!





## Finds the first fibonnaci term to contain fib_length digits. Need to specify the 
# size (array_size) of the array holding fibonnaci numbers.


def euler25(array_size, fib_length)
  n = 0
  fibonnaci(array_size).each do |i|
    n+=1
    if i.to_s.length == fib_length 
      return n
    end
  end
end 

size = 100000
length = 1000

answer = euler25(size, length)

puts "The answer to Project Euler problem 25 is #{answer}."