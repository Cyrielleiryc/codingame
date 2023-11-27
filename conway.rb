# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# r = gets.to_i
# l = gets.to_i

# lines = [[r]]

# écrire chaque ligne en utilisant celle d'avant
# grouper les chiffres identiques entre eux
# afficher le compte puis le chiffre compté
# recommencer
# l.times do |l|
#   line_with_groups = group_numbers(lines[l])
#   next_line = line_with_groups.map { |group| [group.size, group[0]]}.concat
# end

# méthode qui prend un tableau de nombres ex : [1, 1, 4]
# et retourne un tableau de tableaux d'éléments consécutifs égaux [[1, 1], [4]]
def group_numbers(line)
  result = []
  i = 0
  # iteration sur les nombres de la ligne
  while i < line.size
    number = line[i]
    table = [number]

    # Trouver les éléments consécutifs égaux
    while i + 1 < line.size && line[i + 1] == number
      table << line[i + 1]
      i += 1
    end

    result << table
    i += 1
  end
  result
end

# méthode qui prend un tableau d'éléments consécutifs égaux [[1, 1], [4]]
# et retourne une nouvelle ligne => [2, 1, 1, 4]
def create_line(table)
  next_line = table.map { |group| [group.size, group[0]]}.flatten
end

test_array = [1, 1, 1, 2, 2, 1]
puts create_line(group_numbers(test_array)).to_s

# puts lines[-1].join(' ')
