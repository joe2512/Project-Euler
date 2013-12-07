require 'euler_methods.rb'

# Finds the product of the sides of a pythag triple whose sides add to m. n is criteria
# for number of pythag triples worked searched for. Gives whether it is primitive or 
# not and the sides.
# 
# EXAMPLE
# 
# find_correct_triple(100, 1000)
# 
# Puts:
# 
# Not a primitive triple.
# Here are the sides:
# 375
# 200
# 425
# 
# Returns 31875000


def find_correct_triple(n, m)
  for i in pythag_triples(n)
    sides = i.split(',')
    sides.map! {|side| side.to_i }
    if m % sides.inject(:+) == 0
      if sides.inject(:+) == m
        puts "This is a primitive triple."
      else
        puts "Not a primitive triple."
        multiplier = 1000 / sides.inject(:+)
        sides.map! {|side| side*multiplier }
      end
      puts "Here are the sides:\n", sides
      return sides.inject(:*)
    end
  end
  puts "No triple adds to #{m}. Sorry!"
end

puts find_correct_triple(100, 1000)
