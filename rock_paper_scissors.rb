# getting game info from the user
n = gets.to_i
players = []
winners = {} # => {vainqueur => [perdant, perdant, etc]}
n.times do
  numplayer, signplayer = gets.split
  numplayer = numplayer.to_i
  players << { name: numplayer, power: signplayer }
  winners[numplayer] = []
end

# méthode qui donne le joueur vainqueur || exemple en sortie : [{2 => "L"}]
def who_wins(array_of_two_players)
  player1, player2 = array_of_two_players
  rules = { 'R' => %w[C L], 'P' => %w[R S], 'C' => %w[P L], 'L' => %w[S P], 'S' => %w[C R] }
  # si même pouvoir
  return [handle_tie(player1, player2)] if player1[:power] == player2[:power]

  # gestion de tous les cas de victoire
  if rules[player1[:power]].include?(player2[:power])
    return [player1]
  elsif rules[player2[:power]].include?(player1[:power])
    return [player2]
  end

  # si égalité
  [handle_tie(player1, player2)]
end

# méthode qui gère les 2 cas d'égalité pour retourner le plus petit numéro
def handle_tie(player1, player2)
  player1[:name] < player2[:name] ? player1 : player2
end

# méthode pour mettre à jour le tableau des joueurs en supprimant les perdants
def update_players(players, losers)
  losers.each do |loser|
    players.reject! { |player| player == loser }
  end
  players
end

# méthode pour mettre à jour le tableau des vainqueurs en supprimant les perdants
# et en ajoutant le nom du perdant au vainqueur
def update_winners(winner, loser, winners)
  name_of_loser = loser[:name]
  name_of_winner = winner[:name]
  winners.delete(name_of_loser)
  winners[name_of_winner] << name_of_loser
  winners
end

# tant qu'il y a encore des joueurs :
# étape 1 : on les regroupe par 2 pour créer des sub-arrays 'rounds'
# étape 2 : on détermine le vainqueur et le perdant de chaque duel
# étape 3 : on met à jour les listes 'players' et 'winners'
# étape 4 : on recommence avec les joueurs qui sont encore en lice
while players.size != 1
  rounds = players.each_slice(2).to_a
  losers = []
  rounds.each do |round|
    winner = who_wins(round)[0]
    loser = round.reject { |player| player == winner }.first
    losers << loser
    winners = update_winners(winner, loser, winners)
  end
  players = update_players(players, losers)
end

# méthode qui permet de donner en sortie le format attendu
def print_answer(winners)
  one_winner = winners.to_a # { 2 => [6, 5, 1] } => [2, 6, 5, 1]
  losers = one_winner[0][1..]
  [one_winner[0][0], losers.join(' ')]
end

# réponse apportée
puts print_answer(winners)
