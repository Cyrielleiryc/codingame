operation = gets.chomp
pseudo_random_number = gets.to_i
rotors = []
alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split('')
3.times do |i|
  rotor = gets.chomp
  rotors[i] = rotor.split('')
end
message = gets.chomp

case operation
when 'ENCODE'
    puts message
when 'DECODE'
    puts "DECODE"
end

def encode
  # stocker les caractères dans un array => 'message_arr'
  # étape 1 : Caesar shift | message_arr + nb => array 'message_shifted'
  # étapes 2, 3 et 4 : ROTOR shift | message_shifted + rotors => array 'message_rotored'
  # étape 5 : compiler dans une string | message_rotored => string
end

# To debug: STDERR.puts "Debug messages..."
