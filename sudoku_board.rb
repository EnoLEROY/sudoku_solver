require_relative 'tile'

class SudokuBoard
  attr_accessor :grid, :squares

  def initialize(grid)
    @grid = []
    9.times {@grid << []} 
    @all_tiles = []
    set_grid(grid)
    # squares_update
  end

  def print_grid
    output = []
    hight = 8
    space = 2
    (@grid.length*(hight-2)+2).times {output << []}
    # output.each_with_index {|line, i| output[i] << i}
  
    @grid.each_with_index do |line, line_id|
      line.each_with_index do |tile, tile_id|
        color = "3#{tile.square % 5 + 1}"
        ASCII_ALPHABET[tile.number.to_i].each_with_index do |row, i|
          output[line_id * (hight - space) + space + i] << ("036".include?(tile_id.to_s) ? "|||" : "||")
          # notes_line1 = []
          # notes_line2 = []
          # puts "notes : #{notes_line1}, #{notes_line2}"
          if tile.number.to_i == 0
            if tile.notes.length <= 4
              notes_line1 = tile.notes
              notes_line2 = []
            else 
              notes_line1 = tile.notes[0..3]
              notes_line2 = tile.notes[4..-1]
            end
            # puts "notes : #{notes_line1}, #{notes_line2}"
            if i == 0 
              row = "       "
              notes_line1.each_with_index do |note, index|
                row[index * 2] = note.to_s
              end
            elsif i == 1
              row = "       "
              notes_line2.each_with_index do |note, index|
                row[index * 2] = note.to_s
              end
            elsif i == 3
              row = " l#{tile.place[0]}/c#{tile.place[1]} "
            end
            output[line_id * (hight - space) + space + i] << "\033[#{color}m"+row+"\033[0m"
          else
            output[line_id * (hight - space) + space + i] << "\033[#{color}m"+row+"\033[0m"
          end
          output[line_id * (hight - space) + space + i] << "|||" if tile_id == 8 
        end
      end
    end
    output.each_with_index do |line, line_id|
      output[line_id] << ".-------------------------------------------------------------------------------------."  if line_id == 0
      output[line_id] << "||.=======..=======..=======...=======..=======..=======...=======..=======..=======.||"  if ["1", "19", "37"].include?(line_id.to_s)
      output[line_id] << "||.-------..-------..-------...-------..-------..-------...-------..-------..-------.||"  if ["7", "13", "25", "31", "43", "49"].include?(line_id.to_s)
      output[line_id] << "||'-------''-------''-------'''-------''-------''-------'''-------''-------''-------'||"  if ["6", "12", "24", "30", "42", "48"].include?(line_id.to_s)
      output[line_id] << "||'=======''=======''======='''=======''=======''======='''=======''=======''======='||"  if ["18", "54", "36"].include?(line_id.to_s)
      output[line_id] << "'-------------------------------------------------------------------------------------' "  if line_id == 55
    end
    output = output.map {|line| line.join}
    puts output
  end

  def give_notes(tile)
    notes = ((1..9).to_a).map {|a| a.to_s}
    excluded_numbers = []
    @grid.each_with_index do |line, i|
      line.each_with_index do |other_tile, j|
        excluded_numbers << other_tile.number if i == tile.place[0]
        excluded_numbers << other_tile.number if j == tile.place[1]
        excluded_numbers << other_tile.number if other_tile.square == tile.square
      end
    end
    # puts "excluded : #{excluded_numbers}"
    excluded_numbers.uniq.each {|number| notes.delete(number)}
    # puts "note : #{notes}"
    
    tile.notes = notes if tile.number.to_i == 0
  end
  
  def give_all_notes
    @all_tiles.each do |tile|
      tile.reinitialize_notes
      give_notes(tile)
    end
  end
  
  def update_notes
    # p @all_tiles
    @all_tiles.each do |tile|
      give_notes(tile) unless tile.notes.empty?
    end
    # p @all_tiles
  end

  def solve
    81.times do
      give_all_notes
      @all_tiles.each do |tile|
        if tile.notes.length == 1
          tile.number = tile.notes.first
        elsif tile.number.to_i == 0

          line = []
          col = []
          square = []

          @grid.each_with_index do |row, i|
            row.each_with_index do |other_tile, j|
              if tile != other_tile
                line << other_tile.notes if i == tile.place[0]
                col << other_tile.notes if j == tile.place[1]
                square << other_tile.notes if other_tile.square == tile.square
              end
            end
          end

          puts "\033[33mTile #{tile.place}, possible numbers: #{tile.notes}\033[0m"
          [line, col, square].each do |soluce|
            notes_temp = Array.new(tile.notes)
            # puts "tile #{tile.place}: #{tile.notes}/#{notes_temp} (#{soluce})"
            puts "impossible numbers: \033[31m#{soluce.flatten.uniq}\033[0m"
            soluce.flatten.uniq.each do |number|
              notes_temp.delete(number)
            end
            puts "remaining possibilities: \033[32m#{notes_temp}\033[0m (if only one it's the solution) \n\n"
            tile.number = notes_temp.first if notes_temp.length == 1
          end
          
        end
      end
      give_all_notes

      # print_grid
      # sleep(4)
    end
  end

  private

  def set_grid(gird_raw)
    gird_raw.each_with_index do |line, i|
      line.split('').each_with_index do |number, id|
        if i < 3
          if id < 3
            square = 1
          elsif id < 6
            square = 2
          else 
            square = 3
          end
        elsif i < 6
          if id < 3
            square = 4
          elsif id < 6
            square = 5
          else 
            square = 6
          end
        else 
          if id < 3
            square = 7
          elsif id < 6
            square = 8
          else 
            square = 9
          end
        end
        tile = Tile.new({number: number, square: square, place: [i, id]})
        @grid[i] << tile
        @all_tiles << tile
      end
    end
  end
end