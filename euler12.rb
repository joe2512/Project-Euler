require_relative 'euler_methods.rb'

# Finds first triangle number to have n divisors. Hooks if no triangle 
# number has n divisors.
# 
# EXAMPLE
# 
# triangle_divisors(10)
# 
# Returns 5152.


def triangle_divisors(n)
  count = 2
  triangle = 1
  
  while
    triangle += count
    puts "triangle is #{triangle}"
    if number_of_factors(triangle) > n
      return triangle
    end
    count += 1
  end
end


n = 500

answer = triangle_divisors(n)

puts "The first triangle number to have more than #{n} divisors is #{answer}."



####
#### Will work just takes some time.
####