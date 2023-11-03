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

outputs = {}
m.times do
  output_name, type, input_name_1, input_name_2 = gets.split
  outputs[output_name] = [type, input_name_1, input_name_2]
  # => outputs['C'] = ["AND", "A", "B"]
end

# # # Code to implemente the answer # # #
# # # # # # # # # # # # # # # # # # # # #

def trueOrFalse(char)
  return char == "-"
  # '_' => false // '-' => true
end


# # # Code to print the answer  # # #
# # # # # # # # # # # # # # # # # # #
m.times do
  puts "answer"
end
# C ____-_____-_____-_____-___
# D __-----_-----_-----_-----_
# E __--_--_--_--_--_--_--_--_
