# # # Gets the info from the user # # #
# # # # # # # # # # # # # # # # # # # #

n = gets.to_i # the number of temperatures to analyse
inputs = gets.split # array of temperatures
for i in 0..(n-1)
  # t: a temperature expressed as an integer ranging from -273 to 5526
  t = inputs[i].to_i
end

# # # Code to compute the answer # # #
# # # # # # # # # # # # # # # # # # # # #

# transformation de toutes les t° en integer
inputs = inputs.map { |t| t.to_i }

# étape 1 : créer un autre tableau (map) avec le delta entre la t° et 0
def deltas(inputs)
  inputs.map { |t| t < 0 ? -t : t }
end

# étape 2 : récupérer les indexes des plus petits écarts => array
def indexes_small_gap(deltas)
  indexes = []
  # trouver le plus petit écart
  min = deltas.min
  # itérer sur les deltas pour trouver tous les indexes des écarts égaux à min
  deltas.each_with_index do |t, i|
    indexes << i if t == min
  end
  indexes
end

# étape 3 : récupérer dans un tableau la ou les t° associées aux indexes
def temperatures_small_gap(indexes, inputs)
  temperatures = []
  indexes.each do |i|
    temperatures << inputs[i]
  end
  temperatures
end

# étape 4 : si plusieurs t°, ne sortir que la positive
def only_one_temperature(temperatures)
  temperatures.size == 1 ? temperatures[0] : manage_many_temps(temperatures)
end

def manage_many_temps(temperatures)
  t = 0
  temperatures.each do |temp|
    t = temp if temp.positive?
  end
  t = temperatures[0] if t.zero?
  t
end

# étape X : donner la réponse
def answer(inputs)
  return 0 if inputs.empty?

  indexes = indexes_small_gap(deltas(inputs))
  temperatures = temperatures_small_gap(indexes, inputs)
  only_one_temperature(temperatures)
end

# # # Code to print the answer  # # #
# # # # # # # # # # # # # # # # # # #

puts answer(inputs)
