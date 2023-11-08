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
def sort(tableau)
  tableau.sort
end

# étape 2 : itérer sur les puissances et en sortir la différence des 2


# étape 3 : trouver la différence la plus faible et la donner en réponse

# étape X : combiner les étapes 

# # # Code to print the answer  # # #
# # # # # # # # # # # # # # # # # # #

puts horses
