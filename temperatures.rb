# # # Gets the info from the user # # #
# # # # # # # # # # # # # # # # # # # #

n = gets.to_i # the number of temperatures to analyse
inputs = gets.split # array of temperatures
for i in 0..(n-1)
  # t: a temperature expressed as an integer ranging from -273 to 5526
  t = inputs[i].to_i
end

# # # Code to compute the answer # # #
# # # # # # # # # # # # # # # # # # # # #



# # # Code to print the answer  # # #
# # # # # # # # # # # # # # # # # # #

puts inputs[-1]
