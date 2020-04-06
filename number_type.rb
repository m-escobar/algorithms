def number_type(number)
  type = []
  return('um número não inteiro') unless number.integer?

  if number > 0 && number % 15 == 0
    type << 'esotérico'
  else
    type << 'cético'
  end

  type << 'primo' if prime_number(number)

  type = to_sentence(type)
end

def prime_number(number)
  if number <= 1
    result = false
  elsif number == 2 || number == 3 || number == 5
    result = true
  elsif number.even?
    result = false
  elsif number % 3 == 0
    result = false
  elsif number % 5 == 0
    result = false
  else
    result = true
  end

  result
end

def to_sentence(type)
  case type.length
    when 1 then
      sentence = "#{type[0]}"
    when 2 then
      sentence = "#{type[0]} e #{type[1]}"
  end
  sentence
end

def main
  number = [1.15, 0, 1, 2, 3, 4, 5, 7, 9, 11, 13, 15, 17, 19, 25,
            29, 30, 31, 32, 37, 41, 43, 45, 47, 50, 59, 60, 61, 66, 67,
            71, 73, 78, 83, 90, 93, 94, 95, 97, 101, 103, 107, 109,
            113, 127, 131, 137, 140, 149, 151, 157, 163, 167,
            173, 179, 181, 191, 193, 197, 199, 211, 223, 227,
            229, 233, 239, 241, 251, 258, 263, 269, 271, 277,
            281, 283, 293, 300, 307, 311, 313, 317, 331, 337,
            347, 348, 349, 350, 352, 354, 355, 356, 357, 359,
            409, 419, 421, 431, 433, 439, 443, 449, 457, 461,
            463, 468, 479, 487, 491, 499, 503, 509, 521, 523,
            541, 547, 558, 563, 569, 571, 578, 587, 593, 599,
            659, 661, 673, 677, 683, 691, 701, 709, 719, 727,
            733, 739, 743, 751, 757, 761, 769, 773, 787, 797,
            863, 877, 881, 883, 887, 900, 911, 919, 925, 937,
            941, 947, 953, 967, 971, 977, 983, 991, 997, 998,
            999, 1000, 999, 981, 999_983, 999_984
           ]

  number.each do |n|
    type = number_type(n)
    puts "O número #{n} é #{type}."
  end
end


main()
