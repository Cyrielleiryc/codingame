# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

l, h = gets.split.map { |x| x.to_i }
mayas = []
h.times do
  numeral = gets.chomp
  mayas << numeral.chars.each_slice(l).to_a
end

# nombres sous format ["o...", "....", "....", "...."]
s1 = gets.to_i
number1 = []
s1.times do
  num_1line = gets.chomp
  number1 << num_1line
end
s2 = gets.to_i
number2 = []
s2.times do
  num_2line = gets.chomp
number2 << num_2line
end

# récupérer le signe de l'opération
operation = gets.chomp

# chaque ligne est un tableau [".oo.", "o...", "oo..", "ooo.", "oooo", etc]
mayas.map! do |line|
  line.map { |group| group.join('') }
end
# chaque tableau est un chiffre 0 = [".oo.", "o..o", ".oo.", "...."]
MAYA_TRANSLATOR = mayas.transpose

def from_maya_to_integer(number)
  MAYA_TRANSLATOR.index(number)
end

def calculate_answer(operation, number1, number2)
  case operation
  when '+'
    return from_maya_to_integer(number1) + from_maya_to_integer(number2)
  when '-'
    return from_maya_to_integer(number1) - from_maya_to_integer(number2)
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
