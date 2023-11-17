# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement

n = gets.to_i # Number of elements which make up the association table
q = gets.to_i # Number Q of file names to be analyzed
association_table = {}
answers = []
n.times do
  ext, mt = gets.split
  association_table[ext.downcase] = mt
end
q.times do
  fname = gets.chomp
  # récupérer l'extension
  fname_ext = fname.split('.').last
  # s'il n'y a pas d'extension
  if fname[-1] == '.' || !fname.chars.include?('.') || fname_ext.nil?
    answers << 'UNKNOWN'
  # si l'extension est dans la table d'association
  elsif association_table[fname_ext.downcase]
    answers << association_table[fname_ext.downcase]
  # si l'extension n'est pas dans la table d'association 
  else
    answers << 'UNKNOWN'
  end
end

puts answers
