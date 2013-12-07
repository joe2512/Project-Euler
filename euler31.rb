require_relative 'euler_methods.rb'


def euler31(n, m)
  sum = []
  n.upto(n * 1000 - 1) do |i|
    m.upto(m * 100 - 1) do |j|
      s = ""
      s << i.to_s + j.to_s + (i * j).to_s
      if s.length == 9
        if pan_digital?(s)
          puts i,j,i*j
          sum << (i * j) 
        end
      end
    end
  end
  
  sum.uniq.inject(:+)
end
 
 
n = 1
m = 100

answer = euler31(n, m) 

puts "The answer to Project Euler problem 31 is #{answer}."