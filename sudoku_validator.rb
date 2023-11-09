# Getting the grid
grid = []
9.times do
  inputs = gets.split
  line = []
  for j in 0..(9-1)
    n = inputs[j].to_i
    line << n
  end
  grid << line
end

# étape 1 : vérification des lignes
def are_lines_ok(grid)
  answer = true
  grid.each do |line|
    answer = false if line.uniq.length != line.length
  end
  answer
end

# étape 2 : vérification des colonnes en les transformant en lignes
def are_columns_ok(grid)
  new_grid = [[], [], [], [], [], [], [], [], []]
  grid.each do |line|
    i = 0
    while i < line.length
      new_grid[i] << line[i]
      i += 1
    end
  end
  are_lines_ok(new_grid)
end

# étape 3 : vérification des cases 3x3
def are_sub_grids_ok(grid)
  sub_grids = []
  rows = grid.each_slice(3).to_a # => [[3 lines], [3 lines], [3 lines]]
  rows.each do |group|
    sub_grids += create_sub_grid(group)
  end
  are_lines_ok(sub_grids)
end

# sous-méthode pour créer 3 arrays contenant les 9 chiffres de la sous-grille
def create_sub_grid(group_of_3_lines)
  grids = [[], [], []]
  group_of_3_lines.each do |line|
    [0, 1, 2].each do |index|
      grids[0] << line[index]
    end
    [3, 4, 5].each do |index|
      grids[1] << line[index]
    end
    [6, 7, 8].each do |index|
      grids[2] << line[index]
    end
  end
  grids
end

# donner la réponse
puts are_lines_ok(grid) && are_columns_ok(grid) && are_sub_grids_ok(grid)
