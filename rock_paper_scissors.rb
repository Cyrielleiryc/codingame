# getting game info from the user
n = gets.to_i
players = []
winners = {}
n.times do
  numplayer, signplayer = gets.split
  numplayer = numplayer.to_i
  players << { name: numplayer, power: signplayer }
  winners[numplayer] = []
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

# méthode pour dire qui a battu qui dans le duel
  # => {vainqueur => [perdant]}           1er round
  # => {vainqueur => [perdant, perdant]}  2e round etc
  def who_wins(array_of_two_players) # => donne le joueur vainqueur || exemple : {2 => "L"}
    array_of_two_players[0]
  end

# méthode pour mettre à jour le tableau des joueurs
# def update_players(loser, players)
#   players.reject { |player| player == loser }
# end
def update_players(players, losers)
  losers.each do |loser|
    players.reject! { |player| player == loser }
  end
  players
end

# méthode pour mettre à jour le tableau des vainqueurs
def update_winners(winner, loser, winners)
  name_of_loser = loser[:name]
  name_of_winner = winner[:name]
  winners.delete(name_of_loser)
  winners[name_of_winner] << name_of_loser
  winners
end


# # pour chaque round
  # grouper les joueurs par 2 => .each_slice(2).to_a
  # faire un duel au sein de chaque array
  # récupérer le vainqueur et le perdant
  # enlever les perdants des tableaux (players & winners) et recommencer => hash.delete(key)
  # à la fin du jeu, il ne reste qu'un joueur


while players.size != 1
  rounds = players.each_slice(2).to_a
  losers = []
  rounds.each do |round|
    winner = who_wins(round)
    loser = round.reject! { |player| player == winner }.first
    losers << loser
    winners = update_winners(winner, loser, winners)
  end
  players = update_players(players, losers)
end


# réponse apportée
puts winners

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
