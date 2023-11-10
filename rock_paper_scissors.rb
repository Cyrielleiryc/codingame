# getting game info from the user
n = gets.to_i
number_of_rounds = Math.cbrt(n)
players = []
n.times do
  numplayer, signplayer = gets.split
  numplayer = numplayer.to_i
  players << {numplayer => signplayer}
end
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

# # pour chaque round
  # grouper les joueurs par 2 => .each_slice(2).to_a
  # faire un duel au sein de chaque array
  # récupérer le vainqueur et le perdant
  # enlever les perdants des tableaux et recommencer
# # à la fin du jeu
  # il ne reste qu'un joueur
  


# méthode pour dire qui a battu qui dans le duel
  # => {vainqueur => [perdant]}           1er round
  # => {vainqueur => [perdant, perdant]}  2e round etc
def dual(array_of_two_players)

end

# réponse apportée
puts first_round[0]
# # sortie
  # 2 => numéro du vainqueur
  # 6 5 1 => adversaires du vainqueur dans l'ordre chronologique

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# # rules
  # Scissors cuts Paper           C > P
  # Paper covers Rock             P > R
  # Rock crushes Lizard           R > L
  # Lizard poisons Spock          L > S
  # Spock smashes Scissors        S > C
  # Scissors decapitates Lizard   C > L
  # Lizard eats Paper             L > P
  # Paper disproves Spock         P > S
  # Spock vaporizes Rock          S > R
  # Rock crushes Scissors         R > C
  # and in case of a tie, the player with the lowest number wins

# # code
  # Rock (R)
  # Paper (P)
  # sCissors (C)
  # Lizard (L)
  # Spock (S)
