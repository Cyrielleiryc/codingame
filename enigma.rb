operation = gets.chomp
pseudo_random_number = gets.to_i
rotors = []
ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.freeze

3.times do
  rotor = gets.chomp
  rotors << rotor
end
message = gets.chomp

def encode(message, number, rotors)
  # stocker les caractères dans un array => 'message_arr'
  message_arr = message.chars
  # étape 1 : Caesar shift | message_arr + nb => array 'message_shifted'
  message_shifted = caesar(message_arr, number)
  # étapes 2, 3 et 4 : ROTOR shift | message_shifted + rotors => array 'message_rotored'
  message1 = rotoring(message_shifted, rotors[0])
  message2 = rotoring(message1, rotors[1])
  message_rotored = rotoring(message2, rotors[2])
  # étape 5 : compiler dans une string | message_rotored => string
  message_rotored.join
end

def caesar(array, number)
  message_shifted = []
  array.each_with_index do |letter, index|
    former_index = ALPHABET.index(letter)
    new_index = new_index(former_index, number, index)
    new_letter = ALPHABET[new_index]
    message_shifted << new_letter
  end
  message_shifted
end

def new_index(former_index, number, index)
  # si l'addition dépasse 26, alors on repare de 0
  new_index = former_index + number + index
  solution = 0
  if new_index > 25
    solution += new_index % 26
  else
    solution += new_index
  end
  solution
end

def rotoring(message, model)
  new_message = []
  message.each do |letter|
    index_in_alphabet = ALPHABET.index(letter)
    new_letter = model[index_in_alphabet]
    new_message << new_letter
  end
  new_message
end

case operation
when 'ENCODE'
  puts encode(message, pseudo_random_number, rotors)
when 'DECODE'
  puts 'DECODE'
end
