
def fact(n)
  if  n == 0
    return 1
  else
    return n*fact(n-1)
  end
end

def nth_lucas(n)
  if n==0
    return 2
  elsif n==1
      return 1
  end
  if n>=2
    return nth_lucas(n-1) + nth_lucas(n-2)
  end
end

def first_lucas(n)
  a, b = 2, 1
  i = 0
  arr = Array.new
  while i <= n-1
    a, b = b, a + b
    i += 1
    arr.push(a)
  end 
  return arr.to_s
end

def count_digits(n)
  n.to_s.length
end

def sum_digits(n)
  digits = []
  while 
  digits>0
  n = digits.reduce
  end 
  return n
end


def factorial_digits(n)
  n.to_s.chars.map {|d| d.to_i}
  n.map { |d| factorial d  }
  n.reduce {|a,e| a + e}
end

def fib(n)
   if n == 0
    0
  elsif n == 1
    1
  else
    fib(n-1) + fib(n-2)
  end
end

def fib_number(n)
  if n == 1 or n == 0
    return 1
  else
    (fib_number(n-1).to_s + fib(n).to_s).to_i
  end
end

def hack?(n)
  n =  n.to_s 2 # pravi go vuv string s "0" i "1"
  n.reverse == n and n.count('1').odd? #proverqva dali n = n.reverse i dali e nechetno
end

def next_hack(n)
  n = n.next_hack
  while not hack?(n) do
  n = n.next
    end
  n
end

def count_vowels(str)
  vowels = 'aeiouy'.chars
  str.downcase
     .chars
     .select { |ch| vowels.include? ch }
     .length
end

def count_consonants(str)
  consonants = 'bcdfghjklmnpqrstvwxz'.chars
  str.downcase
     .chars
     .select { |ch| consonants.include? ch }
     .length
end

def p_score(n)
  return 1 if palindrome? n
  1 + p_score(n + n.to_s.reverse.to_i)
end

def palindrome?(object)
  object.to_s.reverse == object.to_s
end

def prime?(n)
  counter = 0
  temp = 1

  while temp <= n do
    if n % temp == 0
      counter += 1
      temp += 1
    else
      temp += 1
    end
  end

  if counter <= 2
    true
  else
    false
  end
end

def first_primes(n)
  temp = 2
  result = []

  while n > 0 do
    if prime?(temp) == true
      result << temp
      temp += 1
      n -= 1
    else
      temp += 1
    end
  end
  result
end

def char_is_positive_digit?(n)
  123_456_789_0.to_s.chars.include? n
end

def sum_of_numbers_in_string(str)
  result = 0
  chars = str.chars
  while chars.length > 0
    ns = chars.take_while { |ch| char_is_positive_digit? ch }
    result += ns.join('').to_i

    if ns.length == 0
      chars = chars.drop_while { |ch| !char_is_positive_digit? ch }
    else
      chars = chars.drop(ns.length)
    end
  end
   result
end

def anagrams?(a, b)
  a.chars.sort == b.chars.sort
end

def balanced?(n)
  n = n.to_s
  mid = n.length / 2
  left_part = n.slice(0, mid)
  right_part = n.slice(mid + n.length % 2, n.length)
  sum_digits(left_part.to_i) == sum_digits(right_part.to_i)
end

#def sum_digits(n)
#  digits = n.to_s.chars
#  result, index = 0, 0

# while index < digits.length do
#    result += digits[index].to_i
#    index += 1
#  end
#  result
#end

def zero_insert(n)
  result = ''
  index, n = 0, n.to_s
  while index < n.length - 1
    a, b = n[index].to_i, n[index + 1].to_i
    result += a.to_s
    result += '0' if a == b || (a + b) % 10 == 0
    index += 1
  end
  result += n[index]
  result
end

p nth_lucas(5)

