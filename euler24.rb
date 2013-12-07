require_relative 'euler_methods.rb'


def euler24(array, n)
  perm_lex(array)[n]
end

answer_array = [0,1,2,3,4,5,6,7,8,9]
answer_n = 1000000

answer = euler24(answer_array, answer_n)

puts "The answer to Project Euler problem 17 is #{answer}."

## RUNS BUT TOO LONG TO GET ANSWER ##