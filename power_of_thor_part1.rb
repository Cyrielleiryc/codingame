STDOUT.sync = true # DO NOT REMOVE
# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.
# ---
# Hint: You can use the debug stream to print initialTX and initialTY, if Thor seems not follow your orders.

# light_x: the X position of the light of power
# light_y: the Y position of the light of power
# initial_tx: Thor's starting X position
# initial_ty: Thor's starting Y position
light_x, light_y, initial_tx, initial_ty = gets.split.map { |x| x.to_i }

# game loop
loop do
  remaining_turns = gets.to_i # The remaining amount of turns Thor can move. Do not remove this line.
  direction = ""
  thor = { x: initial_tx, y: initial_ty } # thor[:x] or thor[:y]

  # Thor et l'éclair sont sur la même colonne
  if thor[:x] == light_x
    direction = thor[:y] - light_y >= 0 ? "N" : "S"
  end

  # Thor et l'éclair sont sur la même ligne
  if thor[:y] == light_y
    direction = thor[:x] - light_x >= 0 ? "W" : "E"
  end

  puts direction
end

# A single line IN THE LOOP providing the move to be made: N NE E SE S SW W or NW
# puts "SE"
