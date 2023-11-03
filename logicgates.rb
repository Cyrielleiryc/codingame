# # # Gets the info from the user # # #
# # # # # # # # # # # # # # # # # # # #

n = gets.to_i # 2
m = gets.to_i # 3
inputs = {}
n.times do
  input_name, input_signal = gets.split
  inputs[input_name] = input_signal
  # => inputs['A'] = "__---___---___---___---___"
end

outputs = []
m.times do
  output_name, type, input_name_1, input_name_2 = gets.split
  outputs << [output_name, type, input_name_1, input_name_2]
  # => outputs[0] = ["C", "AND", "A", "B"]
end

# # # Code to implemente the answer # # #
# # # # # # # # # # # # # # # # # # # # #

def trueOrFalse(char)
  return char == "-"
  # '_' => false // '-' => true
end

def char(boolean)
  return boolean ? "-" : "_"
end

def andmethod(one, two)
  new_string = " "
  one.split('').each_with_index do |char, index|
    boo1 = trueOrFalse(char)
    boo2 = trueOrFalse(two[index])
    new_string += char(boo1 && boo2)
  end
  new_string
end

def ormethod(one, two)
  new_string = " "
  one.split('').each_with_index do |char, index|
    boo1 = trueOrFalse(char)
    boo2 = trueOrFalse(two[index])
    new_string += char(boo1 || boo2)
  end
  new_string
end

def onemethod(one, two, verb)
  new_string = " "
  one.split('').each_with_index do |char, index|
    boo1 = trueOrFalse(char)
    boo2 = trueOrFalse(two[index])
    new_string += char(boo1 || boo2)
  end
  new_string
end

# # # Code to print the answer  # # #
# # # # # # # # # # # # # # # # # # #

outputs.each do |output|
  answer = ""
  case output[1]
  when "AND"
    answer += andmethod(inputs[output[2]], inputs[output[3]])
  when "OR"
    answer += ormethod(inputs[output[2]], inputs[output[3]])
  end
  puts output[0] + answer
end


# m.times do
#   puts "answer"
# end
# C ____-_____-_____-_____-___
# D __-----_-----_-----_-----_
# E __--_--_--_--_--_--_--_--_
