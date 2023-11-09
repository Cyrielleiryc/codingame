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


puts are_lines_ok(grid) && are_columns_ok(grid)
