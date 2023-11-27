# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

l, h = gets.split.map { |x| x.to_i }
mayas = []
h.times do
  numeral = gets.chomp
  mayas << numeral.chars.each_slice(l).to_a
end

# chaque ligne est un tableau [".oo.", "o...", "oo..", "ooo.", "oooo", etc]
mayas.map! do |line|
  line.map { |group| group.join('') }
end
# chaque tableau est un chiffre 0 = [".oo.", "o..o", ".oo.", "...."]
MAYA_TRANSLATOR = mayas.transpose

def from_maya_to_integer(number)
  number_into_mayan_digits = number.each_slice(4).to_a
  digits_base_twenty = []
  number_into_mayan_digits.each do |digit|
    digits_base_twenty << MAYA_TRANSLATOR.index(digit)
  end
  number_base_ten = 0
  digits_base_twenty.reverse.each_with_index do |d, index|
    number_base_ten += d * (20 ** index)
  end
  number_base_ten
end

# nombres sous format ["o...", "....", "....", "...."]
s1 = gets.to_i
number1maya = []
s1.times do
  num_1line = gets.chomp
  number1maya << num_1line
end
s2 = gets.to_i
number2maya = []
s2.times do
  num_2line = gets.chomp
number2maya << num_2line
end
number1 = from_maya_to_integer(number1maya)
# puts "number1 = #{number1}"
number2 = from_maya_to_integer(number2maya)
# puts "number2 = #{number2}"

# récupérer le signe de l'opération
operation = gets.chomp

def calculate_answer(operation, number1, number2)
  case operation
  when '+'
    return number1 + number2
  when '-'
    return number1 - number2
  when '*'
    return number1 * number2
  when '/'
    return number1 / number2
  end
end

def from_integer_to_maya(number)
  # TODO = si nombre très grand, faire une boucle avec i = puissance de vingt
  number_base_twenty = []
  hundreds = number / (20**2)
  number_base_twenty << hundreds unless hundreds == 0
  tens = (number % 20**2) / 20
  number_base_twenty << tens unless hundreds == 0 && tens == 00
  unity = number % 20
  number_base_twenty << unity
  number_base_twenty.map { |digit| MAYA_TRANSLATOR[digit] }
end

result = calculate_answer(operation, number1, number2)
puts from_integer_to_maya(result)
