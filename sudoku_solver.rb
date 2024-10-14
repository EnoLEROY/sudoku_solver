require_relative 'grids'
require_relative 'sudoku_board'

puts "which grid ? (#{GRIDS.keys.length})"
print "> "
grid_choice = gets.chomp.strip.to_i

board = SudokuBoard.new(GRIDS[grid_choice])
# puts board.grid

# p board.grid

puts board.print_grid
running = true
while running
  puts "what do you want to do ?"
  puts "1 - give notes on one tile"
  puts "2 - give notes on all tiles"
  puts "3 - enter numbers"
  puts "4 - solve it"
  puts "5 - new grid"
  puts "6 - help solve"
  puts "0 - exit"
  puts "\n\n"

  print "> "
  user_input = gets.chomp.strip.to_i
  
  case user_input
  when 1 
    print "line: "
    line = gets.chomp.strip.to_i
    print "column: "
    column = gets.chomp.strip.to_i

    tile = board.grid[line][column]

    board.give_notes(tile)
    # p tile
    # p board.grid
  when 2
    board.give_all_notes
  when 3
    # print "line:"
    # line = gets.chomp.strip.to_i
    # print "column:"
    # column = gets.chomp.strip.to_i

    # tile = board.grid[line][column]
    # print "number:"
    # number = gets.chomp.strip
    # tile.number = number
    # board.update_notes
    
    
    enter_numbers = true
    while enter_numbers 
      wrong_command = true
      while wrong_command
        print "command (line, column, number): "
        user_input = gets.chomp.strip

        command = user_input.split('').select do |char|
          (0..9).to_a.map {|a| a.to_s}.include?(char)
        end
        p command
        p command.length
        wrong_command = false if (command.length == 3 || user_input == "exit")
        p wrong_command
        p command
      end
      enter_numbers = false if user_input == "exit"
      p command
      line = command[0].to_i
      column = command[1].to_i
      tile = board.grid[line][column]

      tile.number = command[2]
      board.update_notes
      board.print_grid
    end
  when 4
    board.solve
  when 5
    puts "which grid ? (#{GRIDS.keys.length})"
    print "> "
    grid_choice = gets.chomp.strip.to_i

    board = SudokuBoard.new(GRIDS[grid_choice])
  when 6
    enter_numbers = true
    while enter_numbers 
      wrong_command = true
      while wrong_command
        print "command (line, column, number): "
        user_input = gets.chomp.strip

        command = user_input.split('').select do |char|
          (0..9).to_a.map {|a| a.to_s}.include?(char)
        end
        p command
        p command.length
        wrong_command = false if (command.length == 3 || user_input == "exit")
        p wrong_command
        p command
      end
      enter_numbers = false if user_input.downcase == "exit"
      p command
      line = command[0].to_i
      column = command[1].to_i
      tile = board.grid[line][column]

      tile.number = command[2]
      board.solve
      board.print_grid
    end
  when 0
    running = false
  end
  board.print_grid
end

