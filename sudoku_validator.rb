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

puts grid[8].join('')
