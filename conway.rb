# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

r = gets.to_i
l = gets.to_i

lines = [[r]]

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
  table.map { |group| [group.size, group[0]]}.flatten
end

# écrire chaque ligne en utilisant celle d'avant
# grouper les chiffres identiques entre eux
# afficher le compte puis le chiffre compté
# recommencer
(l - 1).times do |a|
  line_with_groups = group_numbers(lines[a])
  lines << create_line(line_with_groups)
end

puts lines[-1].join(' ')
