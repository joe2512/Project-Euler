# Convergents of e
# 
# Problem 65
# 
# The square root of 2 can be written as an infinite continued fraction.
# 
# √2 = 1 +	
# 1
# 
#  	2 +	
# 1
# 
#  	 	2 +	
# 1
# 
#  	 	 	2 +	
# 1
# 
#  	 	 	 	2 + ...
# The infinite continued fraction can be written, √2 = [1;(2)], (2) indicates that 2 
# repeats ad infinitum. In a similar way, √23 = [4;(1,3,1,8)].
# 
# It turns out that the sequence of partial values of continued fractions for square 
# roots provide the best rational approximations. Let us consider the convergents for √2.
# 
# 1 +	
# 1
# 
# = 3/2
#  	
# 2
#  
# 1 +	
# 1
# 
# = 7/5
#  	2 +	
# 1
# 
#  	 	
# 2
#  
# 1 +	
# 1
# 
# = 17/12
#  	2 +	
# 1
# 
#  
#  	 	2 +	
# 1
# 
#  
#  	 	 	
# 2
#  
# 1 +	
# 1
# 
# = 41/29
#  	2 +	
# 1
# 
#  	 	2 +	
# 1
# 
#  
#  	 	 	2 +	
# 1
# 
#  
#  	 	 	 	
# 2
#  
# Hence the sequence of the first ten convergents for √2 are:
# 
# 1, 3/2, 7/5, 17/12, 41/29, 99/70, 239/169, 577/408, 1393/985, 3363/2378, ...
# What is most surprising is that the important mathematical constant,
# e = [2; 1,2,1, 1,4,1, 1,6,1 , ... , 1,2k,1, ...].
# 
# The first ten terms in the sequence of convergents for e are:
# 
# 2, 3, 8/3, 11/4, 19/7, 87/32, 106/39, 193/71, 1264/465, 1457/536, ...
# The sum of digits in the numerator of the 10th convergent is 1+4+5+7=17.
# 
# Find the sum of digits in the numerator of the 100th convergent of the continued 
# fraction for e.


require_relative 'euler_methods.rb'


def euler65(n)
  e_array = [2]
  i = 2
  n.times do |j|
    e_array << 1
    e_array << i
    i += 2
    e_array << 1
  end
  
  fraction = [e_array[0], 1]
  n.times do |i|
    puts "The #{i + 1}th continued fraction of sqrt(e) is #{fraction[0]}/#{fraction[1]}"
    to_add = [1, e_array[i + 1]]
    i.step(1, -1) do |j|
      puts j ## HERE WORK OUT FRACTION
    end
    fraction = add_fraction(fraction, to_add)
    
  end
  digit_sum_of(fraction[0])
end


n = 100

answer = euler65(n) 

puts "The answer to Project Euler problem 65 is #{answer}."





# 2 +   1
#     ___________
#      1   +   1
#             ____ 
#             2 + 1
#                 __
#                 1