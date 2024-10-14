GRIDS = {
  1 => [
    '..1..2...', 
    '....14..9', 
    '.3.9.6.4.', 
    '68.14..2.', 
    '...8.9461',
    '.17.6....',
    '2...9.6..',
    '.....87..',
    '..6...815'
  ],
  2 => [
    '.4.3..9.8', 
    '...6.....', 
    '6.2..5.43', 
    '7..85....', 
    '4.67.125.',
    '.3...4.87',
    '3........',
    '.584791..',
    '.6..23...'
  ],
  3 => [
    '974..3...', 
    '.........', 
    '..196..7.', 
    '.6.5....1', 
    '..71..4..',
    '...2....9',
    '5.9...1..',
    '...3.8..5',
    '6......98'
  ], 
  4 => [
    '5...32...', 
    '...7.....', 
    '..4...35.', 
    '4..6.....', 
    '...25.9.6',
    '7..9..1..',
    '.........',
    '2.85...7.',
    '..3..9.8.'
  ],
  5 => [
    '', 
    '', 
    '', 
    '', 
    '',
    '',
    '',
    '',
    ''
  ]
}

ASCII_ALPHABET = {
  1 => ["   _   ", "  / |  ", "  | |  ", "  |_|  "],
  2 => ["  ___  ", " |_  ) ", "  / /  ", " /___| "],
  3 => ["  ____ ", " |__ / ", "  |_ \\ ", " |___/ "],
  4 => ["  _ _  ", " | | | ", " |_  _|", "   |_| "],
  5 => ["  ___  ", " | __| ", " |__ \\ ", " |___/ "],
  6 => ["   __  ", "  / /  ", " / _ \\ ", " \\___/ "],
  7 => ["  ____ ", " |__  |", "   / / ", "  /_/  "],
  8 => ["  ___  ", " ( _ ) ", " / _ \\ ", " \\___/ "],
  9 => ["  ___  ", " / _ \\ ", " \\_, / ", "  /_/  "],
  0 => ["       ", "       ", "       ", "       "]

}
# ASCII_ALPHABET.values.each do |value|
#   print value.length
#   print ", "
#   puts value.first.length
#   value.each do |line|
#     puts ".#{line}."
#   end
# end

# text = GRIDS[1].map  do |line| 
#   line.split('').map { |number| number == "." ? 0 : number.to_i }.join
# end
# puts "print:"
# puts text


# output = []
# hight = 8
# space = 2
# (text.length*(hight-2)+2).times {output << []}
# # output.each_with_index {|line, i| output[i] << i}

# text.each_with_index do |line, line_id|
#   line.split('').each_with_index do |number, number_id|
#     color = "3#{(1..6).to_a.sample}"
#     ASCII_ALPHABET[number.to_i].each_with_index do |row, i|
#       output[line_id * (hight - space) + space + i] << ("036".include?(number_id.to_s) ? "|||" : "||")
#       output[line_id * (hight - space) + space + i] << "\033[#{color}m"+row+"\033[0m"
#       output[line_id * (hight - space) + space + i] << "|||" if number_id == 8 
#     end
#   end
# end
# output.each_with_index do |line, line_id|
#   output[line_id] << ".-------------------------------------------------------------------------------------."  if line_id == 0
#   output[line_id] << "||.=======..=======..=======...=======..=======..=======...=======..=======..=======.||"  if ["1", "19", "37"].include?(line_id.to_s)
#   output[line_id] << "||.-------..-------..-------...-------..-------..-------...-------..-------..-------.||"  if ["7", "13", "25", "31", "43", "49"].include?(line_id.to_s)
#   output[line_id] << "||'-------''-------''-------'''-------''-------''-------'''-------''-------''-------'||"  if ["6", "12", "24", "30", "42", "48"].include?(line_id.to_s)
#   output[line_id] << "||'=======''=======''======='''=======''=======''======='''=======''=======''======='||"  if ["18", "54", "36"].include?(line_id.to_s)
#   output[line_id] << "'-------------------------------------------------------------------------------------' "  if line_id == 55
# end
# output = output.map {|line| line.join}
# puts output

# puts "\033[31m"+"mauvais"+"\033[0m"