# Takes n numbers and returns the sum of the multiples of these
# numbers below an arbitrary number m.
# 
# EXAMPLE
# 
# sum_multiples(16, 2, 9)
# 
# Sums the multiples of 2 and 9 below 16.
# Returns 65.


def sum_multiples(n, *multiple)
  all_multiples = []
  
  for i in multiple
    j = i
    while j < n
      all_multiples << j unless all_multiples.include?(j)
      j += i
    end
  end
  
  all_multiples.inject(:+)
end


# Finds the sum of the even Fibonacci numbers up to and including
# a value n.
# 
# EXAMPLE
# 
# sum_even_fibonacci(20)
# 
# Returns 23.


def sum_even_fibonacci(n)
  sum = 0
  a = 1
  
  while a <= n
    sum += a if a % 2 == 0
    a = (a * (1 + Math.sqrt(5)) / 2).round
  end
  
  sum
end


# Determines if a number is prime.
# 
# EXAMPLE
# 
# is_prime?(51)
# 
# Returns false.


def is_prime?(n)
  if n == 1 then return false end
  highest_possible_value = Math.sqrt(n)

  for i in (2..highest_possible_value)
    return false if n % i == 0
  end
  
  true
end


# Finds all prime factors of a given number. n must be an integer
# greater than 2. Duplicates is default 'false', can be set as true
# if you want duplicate prime factors.
# 
# EXAMPLE
# 
# prime_factors(210)
# 
# Returns [2, 13, 53]


def prime_factors(n, duplicates = false)
  prime_list = []
  if is_prime?(n)
    prime_list << n
    return prime_list
  end  

  factored = n
  
  for i in (2..n)
    next unless factored % i == 0
    prime_list << i
    factored /= i
    if is_prime?(n / i) and (n / i) != 1
      prime_list << (n / i)
      factored /= (n / i)
    end
    redo
  end
  
  if duplicates == false then prime_list.uniq end
  if duplicates == true then prime_list end
end


## 4 ##

# Finds the lowest common multiple of n numbers.
# 
# EXAMPLE
# 
# lowest_common_factor(4,5,6)
# 
# Returns 60.


def lowest_common_multiple(*n)
  lcf_factors = []
  
  for i in n
    prime_factors_of_i = prime_factors(i, true)
    # p  "#{i}'s prime factors are #{prime_factors_of_i}"
    for j in prime_factors_of_i
      lcf_factors << j if lcf_factors.include?(j) == false
      if lcf_factors.count(j) < prime_factors_of_i.count(j)
        add_num = prime_factors_of_i.count(j) - lcf_factors.count(j)
        add_num.times { lcf_factors << j }
      end
      # p " all the factors together: #{lcf_factors}"
    end
  end
  
  # p lcf_factors
  lcf_factors.reduce(:*)
end
   

# Find the sum of the squares of an array or range.
# 
# EXAMPLE
# 
# sum_of_squares(2..7)
# 
# Returns 139.


def sum_of_squares(s)
  s.inject(0) { |sum, i| sum + i ** 2 }
end


# Finds the square of the sum of an array or range.
# 
# EXAMPLE
# 
# square_of_sum(1..5)
# 
# Returns 225.


def square_of_sum(s)
  s.inject(:+) ** 2
end


# Finds the nth prime given an integer n.
# 
# EXAMPLE
# 
# nth_prime(9)
# 
# Returns 23.
#
# NB. Slow for large numbers, may need to optimize it in future.


def nth_prime(n)
  ordinal = 0
  i = 1
  
  until ordinal == n
    i += 1
    if is_prime?(i) then ordinal+=1 end
  end
  
  i
end


# Finds the greatest product of n consecutive numbers in a string s of
# numbers. n must be an integer.
# 
# EXAMPLE
# 
# greatest_product_in_string("7326948", 2)
# 
# Returns 54.


def greatest_product_in_string(s, n)
  
  if n > s.size then raise ArgumentError, 'Number of consecutive numbers is greater than the string!' end
  greatest = 0
  
  for i in (0..(s.size - n)) 
    array = s.split('')
    c = array[i..(i + n - 1)].inject(1) { |product, j| product * j.to_i }
    if c > greatest then greatest = c end
  end
  
  greatest
end


# Creates an array of primitive Pythagorean triples. Uses a variation
# of Euclid's formulae. Finds n triples.
# 
# EXAMPLE
# 
# pythag_triples(12)
# 
# Returns:
# 
# ["3,4,5", "5,12,13", "15,8,17", "7,24,25", "21,20,29", "9,40,41", "35,12,37", 
# "11,60,61", "45,28,53", "33,56,65", "13,84,85", "63,16,65"]


def pythag_triples(n)
  i = 2
  count = 0
  triples = []

  while
    for j in (1..i)  
      if (i - j) % 2 == 1 and lowest_common_factor(i, j) == i * j
        a = i ** 2 - j ** 2
        b = 2 * i * j
        c = i ** 2 + j ** 2
        triples << "#{a},#{b},#{c}"
        count += 1
        if count == n then return triples end
      end
    end
    i += 1
  end
end


# Builds an array of primes up to n where n is the largest possible prime. Uses sieve of
# erastothenes for optimisation.
# 
# EXAMPLE
# 
# primes_array(20)
# 
# Returns [2, 3, 5, 7, 11, 13, 17, 19].
#


def primes_array(n)
  nums = [nil, nil, *2..n]
  (2..Math.sqrt(n)).each do |i|
    (i**2..n).step(i){|m| nums[m] = nil}  if nums[i]
  end
  nums.compact
end
 

  
# Finds number of divisors of a number.
# 
# EXAMPLE
# 
# number_of_factors(30)
# 
# Returns 6.
# 
# I feel at the end using each_value is a bit messy, could use Enumerable to tidy it up.


# def number_of_factors_old(n)
#   prime_factors = prime_factors(n, true)
#   p prime_factors
#   exponent_count = Hash.new(0)
#   
#   for i in prime_factors
#     exponent_count[i] += 1
#   end
#   
#   p exponent_count
#   number_of_divisors = 1
#   exponent_count.each_value {|value| number_of_divisors *= (value + 1) }
#   p number_of_divisors
#   number_of_divisors
# end

# Optimised version, lots faster.

def number_of_factors(n)
  number_of_factors = 0
  1.upto(Math.sqrt(n)) do |i|
    if n % i == 0
      if n / i == i
        number_of_factors += 1
      else
        number_of_factors += 2
      end
    end
  end
  number_of_factors
end


  
# Find the number of terms before a Collatz sequence
# ends at 1 of a starting number n.
#
#
#
#
#


def number_collatz(n)
  count = 1
  
  until n == 1
    if n % 2 == 0
      n /= 2
    else 
      n = (3 * n) + 1
    end
    count += 1
  end 
  count
end

# p number_collatz(13),"13 answer"
# p number_collatz(6), "6 answer"


# Performs the factorial function (!) on a positive integer
# n.

def factorial(n)
  (1..n).inject(:*) || 1
end

## Returns an array of unitary divisors.

# ---


# Returns the sum of the digits of a number.
#
# EXAMPLE
#
# sum_of_digits(456789)
#
# Returns 39.


def sum_of_digits(n)
  integer_split_into_array(n).inject(:+)
end


# Takes an integer and gives an array with each digit as each entry in the array.
#
# EXAMPLE
#
# integer_split_into_array(14876)
#
# Returns [1, 4, 8, 7, 6]


def integer_split_into_array(n)
  n_array = (n.to_s).split("")
  n_array.map {|i| i.to_i}
end


# Given a number up to XXXXX, returns a string with that number in word form. Could make 
# given number higher if needed.
#
# EXAMPLE
#
# word_of_number(999)
#
# Returns "nine hundred and ninety nine".


def word_of_number(n)
  raise ArgumentError, "Your number is too big." unless n < 1000

  array = integer_split_into_array(n)
  key = { 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six",
  		7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten", 11 => "eleven", 
  		12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen",
  		16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen",
  		20 => "twenty", 30 => "thirty", 40 => "forty", 50 => "fifty", 60 => "sixty", 
  		70 => "seventy", 80 => "eighty", 90 => "ninety", 0 => "" }
  n_as_string = ""
  
  if array[-2] == 1
    n_as_string << key[array[-2] * 10 + array[-1]]
  elsif array[-1]
    n_as_string << key[array[-1]] unless array[-1] == 0
    if array[-2]
      n_as_string = key[array[-2] * 10] + " " + n_as_string unless array[-2] == 0
    end
  end
  
  if array[-3]
    if n_as_string == "" 
      n_as_string = key[array[-3]] + " hundred"
    else
      n_as_string = key[array[-3]] + " hundred and " + n_as_string
    end
  end
  
  n_as_string.strip
end


## Returns a array containing all proper divisors of a number n. Note, not sorted.
#
# EXAMPLE
#
# proper_divisors(64)
#
# Returns [1, 2, 32, 4, 16, 8].

def proper_divisors(n)
  pd = [1]
  upper_limit = Math.sqrt(n)
  
  2.upto(upper_limit) {|i| if n % i == 0 then pd << i and pd << n / i end}

  pd.uniq
end


## Checks if two numbers are amicable (the sum each number's proper divisors equals
# the other number.
#
# EXAMPLE
#
# amicable_numbers?(220, 284)
# 
# Returns true.


def amicable_numbers?(n, m)
  n_sum = proper_divisors(n).inject(:+)
  m_sum = proper_divisors(m).inject(:+)
  
  if n_sum == m and m_sum == n
    true
  else
    false
  end
end


## Sorts an array of strings alphabetically.

def alphabeta_sort(array)
  array.sort!
end
  
  
## Finds the value of a word based on 'a' being worth 1, 'b' being worth 2, 'c' being
# worth 3 and so on.

def alphabet_value(word)
  key = {'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6, 'g' => 7, 'h' => 8,
  		'i' => 9, 'j' => 10, 'k' => 11, 'l' => 12, 'm' => 13, 'n' => 14, 'o' => 15, 
  		'p' => 16, 'q' => 17, 'r' => 18, 's' => 19, 't' => 20, 'u' => 21, 'v' => 22,
  		'w' => 23, 'x' => 24, 'y' => 25, 'z' => 26}
  value = 0
  word = word.downcase

  word.each_char {|i| value += key[i]}
  
  value
end


## Makes an array of abundant (sum of proper divisors is bigger than itself 
# numbers up to n.
#
# EXAMPLE
#
# puts abundant(40)
#
# Returns [12, 18, 20, 24, 30, 36, 40].

def abundant(n)
  abundant_list = []
  
  1.upto(n) do |i|
    if proper_divisors(i).inject(:+) > i
      abundant_list << i
    end
  end

  abundant_list
end
 
## Given an array of digits, returns an array of arrays of
# every permutation of the digits in lexographical order.

def perm_lex(digits)
  sorted = digits.sort
  length = digits.length
  sorted.repeated_permutation(length).to_a
end

## Returns the nth Fibonnaci number. Uses Binet's formula.
# NB Only works up to n = 1474.


def nth_fibonnaci(n)
  result = (1 / Math.sqrt(5)) * ((((1 + Math.sqrt(5)) / 2) ** n) - (((1 - Math.sqrt(5)) / 2) ** n))
  puts result
  begin
  result.to_i
  rescue
    puts "uh oh"
    1
  end
end


## Finds number of digits of an integer without converting to a string.

def num_dig(number)
  Math.log10(number).to_i + 1
end


## Returns an array consisting of the fibonnaci sequence up to n. n must b

def fibonnaci(n)
  seq = []
  a = 1
  b = 1
  
  1.upto(n) do
    seq << a
    c = b
    b = b + a
    a = c
  end
  
  seq
end


## Tests a fraction and checks if it is recurring. d is a string of the form "x/y"
## 

def is_recurring?(d, check = 10)
  check_array = []
  
  0.upto(check) do |a|
    0.upto(check) do |b|
      check_array << 2 ** a * 5 ** b
    end
  end
  
  check_array.each do |i|
    if i % d.split("/")[1].to_i == 0 then return true end
  end
  false
end


## Tests a fraction that makes a recurring decimal and returns the recurring period.
# d is a string of the form "x/y". Only works when the denominator is prime.
# Returns 0 if fails.

def rec_period(d)
  divisor = 9
  count = 1
  
  while count < 1000
    if divisor % d.split("/")[1].to_i == 0 
      return count
    end
    count += 1
    divisor = divisor * 10 + 9
  end
  0
end


# Finds the sum of each digits of an integer.

def digit_sum_of(number)
  digits = number.to_s.split("")
  sum = 0
  digits.each {|i| sum += i.to_i}
  sum
end 


## Finds the sum of each digit of an integer to the power of n.
#
# EXAMPLE
#
#  puts sum_digit_power(1634, 4)
#
# Returns (1 ** 4 + 6 ** 4 + 3 ** 4 + 4 ** 4) = 1634


def sum_digit_power(number, n)
  digits = number.to_s.split("")
  sum = 0
  digits.each {|i| sum += i.to_i ** n}
  sum
end 


## Checks if a number is pandigital (only uses digits 1-9 once or less). Returns true or 
# false. Can take integer, string or array of digits. Can also be 0-9 pandigital if
# parameter is changed to true.
# 
# EXAMPLES
# 
# puts pan_digital?("132")              Returns true
# puts pan_digital?(11)                 Returns false
# puts pan_digital?([2,5,3,7,8,9])      Returns true


def pan_digital?(n, zero_check = false)
  if n.class == String
    check = n.split("")
  elsif n.class == Fixnum
    check = n.to_s.split("")
  elsif n.class == Array
    check = n
  end
  
  if check.include?(0) or check.include?("0")
    if zero_check == false
      false
    end
  end
  
  if check.uniq.length == check.length
    true
  else
    false
  end
end




# Given a fraction in the form of a 2 entry array, returns the fraction in its
# simplest form.


def simplify_fraction(fraction)
  a = fraction[0]
  b = fraction[1]
  primes_array(a).each do |i|
    if a % i == 0 and b % i == 0
      a /= i
      b /= i
      redo
    end
  end
  
  [a, b]
end


## Finds the sum of the factorials of the digits of a number.

def sum_of_dig_factorial(n)
  sum = 0
  n.to_s.split("").each do |i| 
    sum += factorial(i.to_i)
  end

  sum
end
    
    
# Checks a prime to see if it's circular. Must be prime.

def prime_is_circular?(n)
  # optimisation based on all circular primes consisting only of 1,3,7 or 9. Returns
  # 2 and 5 instantly as true to avoid check.
  if n == 2 or n == 5 then return true end
  check = n.to_s
  [0,2,4,5,6,8].each{|i| if n.to_s.include?(i.to_s) then return false end}
# 
  1.upto(n.to_s.length) do |j|
    if is_prime?(check.to_i) == false
      return false
    end
    check.concat(check.slice!(0))
  end
  
  return true
end
    
    
# Checks a prime to see if it's circular. Doesn't have to be prime.
#
#
#
#
#


# REturns the binary form of a number.

def to_binary(n)
# Uses Integer#to_s(base) to convert to base 2.  
  n.to_s(2).to_i
end


# Returns true or false depending if the entered string or integer is palindromic.

def palindromic?(a)
# If a is an integer converts it to a string.
  if a.class == Fixnum or a.class == Bignum
    a = a.to_s 
  end
  if a == a.reverse
    true
  else
    false
  end
end


# Calculates all pythag triples. Needs 2 arguments, n is number of prim triples, p
# is number to which calculate triples. This NEEDS changing to 1 argument or maybe 
# totally rewriting, is quite ugly atm.


def all_pythag_triples(n, p)
  trips = []
  prim_trips = pythag_triples(n)
  prim_trips.each do |i|
# Next line changes the form of the strings in array to three part arrays of integers.  
    i = i.split(",").map{|i| i.to_i}
    a = i
    mult = 1
    while a.inject(:+) <= p
      trips << a
      mult += 1
      a = i.map{|i| i * mult}
    end
  end
  
  trips
end


# Returns a string of the natural numbers concatenated together up to n.


def list_of_integers(n)
  integers = ""
  1.upto(n) do |i|
    integers << i.to_s
  end
  
  integers
end


# Returns an array of n triangle numbers.

def triangle_array(n)
  array = []
  1.upto(n) do |i|
    array << i * (i + 1) / 2
  end
  
  array
end


# Returns an array of n pentagonal numbers.

def pentagon_array(n)
  array = []
  1.upto(n) do |i|
    array << i * (3 * i - 1) / 2
  end
  
  array
end


# Returns an array of n hexagonal numbers.

def hexagon_array(n)
  array = []
  1.upto(n) do |i|
    array << i * (2 * i - 1)
  end
  
  array
end


# Returns true or false depending if the two integer or string parameters are 
# permutations of each other.

def permutation?(a, b)
# If a is an integer converts it to a string.
  if a.class == Fixnum or a.class == Bignum then a = a.to_s end
  if b.class == Fixnum or b.class == Bignum then b = b.to_s end
  if a.chars.sort.join == b.chars.sort.join
    true
  else
    false
  end
end


# Finds number of routes in a n x n grid going from top left to bottom right.

def square_paths(n)
#   Each hash element will be a possible route connected to an array which is its co-ordinate
#   position.
  routes = { "r1" => [0, n] }
  count = 2
  routes_all_finished = false
  i = 0
  until routes.empty?
    i += 1
    puts "round"
#   Use .dup to be able to add to the hash during iteration.
    routes.dup.each do |k, v|
      p v
#     Check if the route has reached the right or bottom side of the grid, if so, the route
#     has no more deviations and can be marked as "finished"
      if v[0] == n or v[1] == 0 
        routes.delete(k)
      else
#       Moves one route to the right and creates a new one one to the bottom.
        routes["r#{count}"] = [v[0], v[1] - 1]
        v[0] += 1
        count += 1
      end
    end
  end
  p routes
  count - 1
end


# Takes an array of integers. Returns an array with every possible addition between
# all the elements.

def added_combinations(array)
  add_array = []
  array.each do |i|
    array.each do |j|
      if add_array.include?(i + j) == false
        add_array << i + j
      end
    end
  end
  add_array
end


# Takes the biomial coefficient of n and k.

def binomial_coefficient(n, k)
  product = 1
  # Uses multiplicative formula to derive.
  1.upto(k) do |i|
    product *= ((n - (k - i)) / i.to_f) # Use float to deal with non-integer division.
  end
  product.to_i
end


# Takes a string like "2H 2D 4C 4D 4S" and returns the hand and highest card(s).

def poker_hand(cards)
  cards_array = cards.delete(" ").split("")
  # Convert Jack, Queen, King and Ace into numbers and changes 10 from "1", "0" to "10"
  pictures = {  "1" => "10",
  				"J" => "11",
  				"Q" => "12",
  				"K" => "13",
  				"A" => "14" }
  cards_array = cards_array.map do |i|
    if pictures[i]
      if pictures[i] == "0"
        nil
      end
      pictures[i]
    else
      i
    end
  end
  # Deletes spare "0" emanating from the "10"
  cards_array.delete("0")
  p cards_array
  
  # Finds highest card
  highest = 0
  (0..8).step(2) do |i|
    if cards_array[i].to_i > highest then highest = cards_array[i].to_i end
  end
  
  # Test "Four of a kind"
  check = []
  (0..8).step(2) do |i|
    check << cards_array[i]
    if check.count(cards_array[i]) == 4
      return "Four of a kind" + "-" + cards_array[i]
    end
  end
  
  # Test "Flush" - checks that the cards are all same as first card
  check = []
  (1..9).step(2) do |i|
    if cards_array[i] == cards_array[1]
      if i == 9 then return "Flush" + "-" + highest.to_s end
    else
      break
    end
  end
  
  # Test "Straight"
  (0..8).step(2) do |i|
    last_card = 0
    if i == 0
      last_card = cards_array[i]
      puts last_card
      next
    end
    puts "SASAS #{last_card}"
    puts "SADSADS #{cards_array[i]}"
    if cards_array[i].to_i != last_card.to_i + 1
      break
    end
    last_card = cards_array[i]
    if i == 8 then return "Straight" + "-" + highest.to_s end
  end
  
  # Test "Three of a kind"
  check = []
  (0..8).step(2) do |i|
    check << cards_array[i]
    if check.count(cards_array[i]) == 3
      return "Three of a kind" + "-" + cards_array[i]
    end
  end
  
  # Test "Two Pair"
  check = []
  n = 0
  (0..8).step(2) do |i|
    check << cards_array[i]
    if check.count(cards_array[i]) == 2
      n += 1
      if n == 2
        return "Two Pair" + "-" + cards_array[i]
      end
    end
  end
  
  # Test "Pair"
  check = []
  (0..8).step(2) do |i|
    check << cards_array[i]
    if check.count(cards_array[i]) == 2
      return "Pair" + "-" + cards_array[i]
    end
  end
  
  "High Card" + "-" + highest.to_s
end

# #fourofakind
# puts poker_hand("2D AH AC AS AD")
# #flush
# puts poker_hand("2D 5D 9D JD AD")
# #straight
# puts poker_hand("4H 5S 6D 7S 8S")
# #threeofakind
# puts poker_hand("9H 9S 9D JS AS")
# #twopair
# puts poker_hand("2D 2S 9D 9C KD")
# #pair
# puts poker_hand("2D 10H 10D KD AS")
# #highpair
# puts poker_hand("2D 5D 9D JC AD")


# Works out the continued fraction of a value n returning a string like "41/29"
# n - √ n = 1 + 1/(n + 1/(n + 1/(n + ... ))) = ...
# m is number of iterations.

def continued_fraction(m, n)
  if m == 1
    return "1/1"
  elsif m == 2
    return "#{n + 1}/#{n}"
  end
#   a is numerator, b is denominator
  a = n ** 2 + 1
  b = n
#   iterates by reversing a and b then adding 2 each time ( allowing for the fraction)
  (m - 2).times do
    c = a
    a = b
    b = c
    a += b * 2
  end
  a -= b
  "#{a}/#{b}"
end
    
## Uses the (very fast) Euclidean algorithm for findind the greatest common divisor of
## two numbers.

def greatest_common_divisor(a, b)
  if a > b
  	c = a
  	a = b
  	b = c
  end
  while
  	c = b % a
  	if c == 0 then return a end
  	b = a
  	a = c
  end
end

## Second lowest common multiple function. Uses a faster algorithm.

def lowest_common_multiple2(a, b)
  (a / greatest_common_divisor(a, b)) * b
end

puts lowest_common_multiple2(18, 52)
puts lowest_common_multiple2(4, 9)
puts lowest_common_multiple2(5, 10)






# ruby euler_methods.rb
# skipped : 27, 31, 51
# not working : 23! (time), 24 (time), 41 (time...), 43 (time...),
# 44 (time...), 47 (time), 18! (head hurts) 50 (time)

# need to change all little eulers to require or require_relative and maybe change
# the load path.

# flesh out ones with no examples

# could change all answer to a little phrase with string interpolation

# could write out the question in each eulern.rb
# also maybe put the def for eulern()

#one whitespace line at end of every doc

# could add to each eulern.rb:
# 
# s_time = Time.now # at start
# e_time = Time.now # at end
# puts "Time taken: #{(e_time - s_time) * 1000} milliseconds." 

# At start put an introduction to my methods and ideas and how this is all arranged.


# powers don't work when copy pasting the questions


# bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla
# bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla
# PARAMETER(s):
# RETURNS:
# EXAMPLE: