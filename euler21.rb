require_relative 'euler_methods.rb'


def euler21(n)
  amicable = []
  
  1.upto(n) do |i|
    check = proper_divisors(i).inject(:+)
    if i == check then next end
    if amicable_numbers?(i, check)
      amicable << i and amicable << check unless amicable.include?(i) or amicable.include?(check)
    end
  end
  
  amicable.inject(:+)
end


n = 9999

answer = euler21(n)

puts "The answer to Project Euler problem 21 is #{answer}."
