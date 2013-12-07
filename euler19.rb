# Counting Sundays
# 
# Problem 19
# 
# You are given the following information, but you may prefer to do some research for 
# yourself.
# 
# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4, but not on a century unless it 
# is divisible by 400.
# 
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 
# 1901 to 31 Dec 2000)?


require_relative 'euler_methods.rb'


def euler19
  sundays = 0
  year = 1900
  month = 1 # January
  day = 1 # Monday, Sunday is 7
  date = 1 # 1st
  until year == 2001
    if date == 1 and day == 7 and year != 1900 then sundays += 1 end
    if day == 8 then day = 1 end
    date += 1
    day += 1
    puts date
    puts month
    puts year
    if month == 2 and year % 4 == 0 and date == 30
      puts "d"
      date = 1
      month += 1
    elsif month == 2 and date == 29
      puts "c"
      date = 1
      month += 1
    elsif month == 4 or month == 6 or month == 9 or month == 11 and date == 31
      puts "b"
      date = 1
      month += 1
    elsif month == 1 or month == 3 or month == 5 or month == 7 or month == 8 or month == 10 and date == 32
      puts "a"
      date = 1
      month += 1
    elsif month == 12 and date == 32
      puts "AAAAAAADDDSDSDSDSDSSDSDSDSDSDSDSDSDSDSDS"
      date = 1
      month = 1
      year += 1
    end
  end
  sundays
end


answer = euler19 

puts "The answer to Project Euler problem 19 is #{answer}."