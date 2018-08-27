require_relative 'pieces'

class Board
  def self.make_grid
    grid = Array.new(8) { Array.new(8) { NullPiece.new }}
    grid.map!.with_index do |row, i|
      if i == 1 
        row.map! do |cell|
          cell = Pawn.new(:black)
        end
      elsif i == 6
        row.map! do |cell|
          cell = Pawn.new(:white)
        end
      elsif i == 0 
        row = [Rook.new(:black), Knight.new(:black), Bishop.new(:black), Queen.new(:black), 
          King.new(:black), Bishop.new(:black), Knight.new(:black), Rook.new(:black)]
      elsif i == 7 
        row = [Rook.new(:white), Knight.new(:white), Bishop.new(:white), King.new(:white),  
           Queen.new(:white), Bishop.new(:white), Knight.new(:white), Rook.new(:white)]
      else
        row 
      end
    end
  end
  
  attr_reader :grid
  
  def initialize
    @grid = Board.make_grid
  end
  
  def move_piece(start_pos, end_pos)
    if self[start_pos].is_a?(NullPiece)
      raise ArgumentError, "no piece at this position"
    elsif self[end_pos].class != NullPiece
      if self[start_pos].color == self[end_pos].color
        raise ArgumentError, "that's your piece"
      end
    end
    
    if self[start_pos].valid_move?(start_pos, end_pos)
      self[end_pos] = self[start_pos]
      self[start_pos] = NullPiece.new 
    end 
    # might need reccue for error still in different method
    # we need valid move to work
  end
  
  def [](pos)
    row, col = pos
    @grid[row][col]
  end
  
  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end
end

