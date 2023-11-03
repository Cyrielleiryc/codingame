# _ => false
# - => true

def trueOrFalse(char)
  return char == "-"
end

n = gets.to_i # 2
m = gets.to_i # 3
inputs = {}
n.times do
  input_name, input_signal = gets.split
  inputs[input_name] = input_signal
end
# A __---___---___---___---___
# B ____---___---___---___---_

outputs = {}
m.times do
  output_name, type, input_name_1, input_name_2 = gets.split
  outputs[output_name] = [type, input_name_1, input_name_2]
end
# C AND A B
# D OR A B
# E XOR A B

m.times do
  puts "answer"
end
# C ____-_____-_____-_____-___
# D __-----_-----_-----_-----_
# E __--_--_--_--_--_--_--_--_

puts "inputs ="
puts inputs['A']
puts "outputs ="
puts outputs['C'][0]
