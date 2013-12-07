require_relative 'euler_methods.rb'


def euler17(n)
  s = "one thousand"
  (1..999).each {|i| s << word_of_number(i)}
  s.gsub(/\s+/, "").length
end

answer = euler17(999)

puts "The answer to Project Euler problem 17 is #{answer}."