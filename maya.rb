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
  if number.size == 4
    return MAYA_TRANSLATOR.index(number)
  end
  new_number = number.each_slice(4).to_a
  tens = MAYA_TRANSLATOR.index(new_number[0])
  unity = MAYA_TRANSLATOR.index(new_number[1])
  tens * 20 + unity
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
number2 = from_maya_to_integer(number2maya)

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
  end
end

def from_integer_to_maya(number)
  if number < 20
    return MAYA_TRANSLATOR[number]
  end
  tens = number / 20
  unity = number - (20 * tens)
  [MAYA_TRANSLATOR[tens], MAYA_TRANSLATOR[unity]]
end

result = calculate_answer(operation, number1, number2)
puts from_integer_to_maya(result)
