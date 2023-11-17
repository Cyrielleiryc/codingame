# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement

n = gets.to_i # Number of elements which make up the association table
q = gets.to_i # Number Q of file names to be analyzed
association_table = {}
# files = []
answers = []
n.times do
  ext, mt = gets.split
  association_table[ext.downcase] = mt
end
q.times do
  fname = gets.chomp # One file name per line
  fname_ext = fname.split('.').last
  if fname[-1] == '.' || !fname.chars.include?('.') || fname_ext.nil?
    answers << 'UNKNOWN'
  elsif association_table[fname_ext.downcase]
    answers << association_table[fname_ext.downcase]
  else
    answers << 'UNKNOWN'
  end
end

# # étape 1 : itérer sur les fichiers
# files.each do |file|
#   if
#     answers << 'UNKNOWN'
#     return answers
#   end
#   # étape 2 : vérifier si l'extension existe dans les clés (si oui => étape 3, si non "UNKNOWN")
#   # étape 3 : trouver le MIME correspondant
#   if association_table[file]
#     answers << association_table[file]
#   else
#     answers << 'UNKNOWN'
#   end
# end

puts answers

# # entrée
# 2                 => n
# 4                 => q
# html text/html    => extension MIME
# png image/png
# test.html         => fichiers à tester
# noextension
# portrait.png
# doc.TXT

# # sortie
# text/html
# UNKNOWN
# image/png
# UNKNOWN
