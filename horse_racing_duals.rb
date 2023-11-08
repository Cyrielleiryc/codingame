# # # Gets the info from the user # # #
# # # # # # # # # # # # # # # # # # # #

n = gets.to_i
horses = []
n.times do
  pi = gets.to_i
  horses << pi
end

# # # Code to compute the answer # # #
# # # # # # # # # # # # # # # # # # # # #

# étape 1 : ranger les puissances dans l'ordre croissant

# étape 2 : itérer sur les puissances et en sortir la différence des 2 => tableau
# supprimer la valeur négative (la première)
def deltas(tableau)
  deltas = []
  tableau.each_with_index do |pi, index|
    deltas << pi - tableau[index - 1]
  end
  deltas[1..-1]
end

# étape 3 : trouver la différence la plus faible et la donner en réponse

# étape 4 : combiner les étapes
def answer(horses)
  deltas = deltas(horses.sort)
  deltas.min
end

# # # Code to print the answer  # # #
# # # # # # # # # # # # # # # # # # #

puts answer(horses)
