require "colorize"

class Display
  attr_reader :board
  
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board 
  end
  
  def render
    @board.grid.each do |row|
      row.each do |piece|
        print " #{piece.class} "
      end
      print '\n'
    end
  end
end 