STDOUT.sync = true # DO NOT REMOVE
# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.
# ---
# Hint: You can use the debug stream to print initialTX and initialTY, if Thor seems not follow your orders.

# light_x: the X position of the light of power
# light_y: the Y position of the light of power
# initial_tx: Thor's starting X position
# initial_ty: Thor's starting Y position
light_x, light_y, initial_tx, initial_ty = gets.split.map(&:to_i)
thor = { x: initial_tx, y: initial_ty } # thor[:x] or thor[:y]

# game loop
loop do
  remaining_turns = gets.to_i # The remaining amount of turns Thor can move. Do not remove this line.
  direction = ''

  # comparaisons
  thor_should_go_west = thor[:x] > light_x
  thor_should_go_north = thor[:y] > light_y

  # Thor et l'éclair sont sur la même colonne
  if thor[:x] == light_x
    direction = thor_should_go_north ? 'N' : 'S'
  elsif thor[:y] == light_y
    direction = thor_should_go_west ? 'W' : 'E'
  elsif thor_should_go_west
    direction = thor_should_go_north ? 'NW' : 'SW'
  else
    direction = thor_should_go_north ? 'NE' : 'SE'
  end

  case direction
  when 'N'
    thor[:y] -= 1
  when 'S'
    thor[:y] += 1
  when 'W'
    thor[:x] -= 1
  when 'E'
    thor[:x] += 1
  when 'NW'
    thor[:y] -= 1
    thor[:x] -= 1
  when 'SW'
    thor[:y] += 1
    thor[:x] -= 1
  when 'NE'
    thor[:y] -= 1
    thor[:x] += 1
  when 'SE'
    thor[:y] += 1
    thor[:x] += 1
  end

  # gives the computer the direction for the next move
  puts direction
end
