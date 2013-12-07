require_relative 'euler_methods.rb'


def euler22()
  
  # Open the file and make it into a usable array.
  
  names = File.open('names.txt', 'r') { |file| file.gets.split(",") }
  names.map! {|i| i.gsub('"', '')}
  names.map! {|i| i.gsub('/', '')}
  
  # Sorts the array alphabetically.
  
  alphabeta_sort(names)
  
  # Finds total value for each word and adds it to the running total.
  
  count = 1
  total = 0
  
  names.each do |name|
    total += count * alphabet_value(name)
    count += 1
  end
  
  total
end

answer = euler22()

puts "The answer to Project Euler problem 21 is #{answer}."
