require_relative 'pieces'

class Board
  def self.make_grid
    grid = Array.new(8) { Array.new(8) { NullPiece.new }}
    grid.map!.with_index do |row, i|
      if i == 1 || i == 6
        row.map! do |cell|
          cell = Pawn.new
        end
      elsif i == 0 
        row = [Rook.new, Knight.new, Bishop.new, Queen.new, 
          King.new, Bishop.new, Knight.new, Rook.new]
      elsif i == 7 
        row = [Rook.new, Knight.new, Bishop.new, King.new,  
           Queen.new, Bishop.new, Knight.new, Rook.new]
      else
        row 
      end
    end
  end
  
  attr_reader :grid
  
  def initialize
    @grid = Board.make_grid
  end
  
  
end

