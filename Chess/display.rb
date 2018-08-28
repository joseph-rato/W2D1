require "colorize"
require_relative "board"
require_relative "cursor"

class Display
  attr_reader :board
  
  def initialize(board=Board.new)
    @cursor = Cursor.new([0,0], board)
    @board = board 
  end
  
  def render
    @board.grid.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        if [i, j] == @cursor.cursor_pos
          print "| #{piece.visual} |".colorize(:green)
        else
          print "| #{piece.visual} |".colorize(piece.color)
        end
      end
      print "\n"
    end
  end
  
  def cursor_board
    while true
      self.render
      @cursor.get_input
      system 'clear'
    end
  end
end 