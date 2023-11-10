# getting game info from the user
n = gets.to_i
first_round = []
n.times do
  numplayer, signplayer = gets.split
  numplayer = numplayer.to_i
  first_round << {numplayer => signplayer}
end


puts first_round[0][4]

# # # test 1

# # entrée

# 8 => nombre de joueurs
# 4 R => numéro du joueur + le coup qu'il joue
# 1 P
# 8 P
# 3 R
# 7 C
# 5 S
# 6 L
# 2 L

# # sortie

# 2 => numéro du vainqueur
# 6 5 1 => adversaires du vainqueur dans l'ordre chronologique

# # rules
# Scissors cuts Paper
# Paper covers Rock
# Rock crushes Lizard
# Lizard poisons Spock
# Spock smashes Scissors
# Scissors decapitates Lizard
# Lizard eats Paper
# Paper disproves Spock
# Spock vaporizes Rock
# Rock crushes Scissors
# and in case of a tie, the player with the lowest number wins (it's scandalous but it's the rule).
