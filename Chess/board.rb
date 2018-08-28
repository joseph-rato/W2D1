require_relative 'pieces'

class Board
  def self.make_grid
    grid = Array.new(8) { Array.new(8) { NullPiece.instance }}
    
    grid.map!.with_index do |row, i|
      if i == 1 
        row.map!.with_index do |cell, j|
          cell = Pawn.new([i, j],:black)
        end
      elsif i == 6
        row.map!.with_index do |cell, j|
          cell = Pawn.new([i, j], :white)
        end
      elsif i == 0 
        row = [Rook.new([i, 0], :black), Knight.new([i, 1], :black), Bishop.new([i, 2], :black), Queen.new([i, 3], :black), 
          King.new([i, 4], :black), Bishop.new([i, 5], :black), Knight.new([i, 6], :black), Rook.new([i, 7], :black)]
      elsif i == 7 
        row = [Rook.new([i, 0], :white), Knight.new([i, 1], :white), Bishop.new([i, 2], :white), King.new([i, 3], :white),  
           Queen.new([i, 4], :white), Bishop.new([i, 5], :white), Knight.new([i, 6], :white), Rook.new([i,7], :white)]
      else
        row 
      end
    end
  end
  
  attr_reader :grid
  
  def initialize
    # @sentinel = NullPiece.instance
    # why does using @sentinel cause our board to be nil instead of what it should be change like 5 to @sentinel to show
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
      self[start_pos] = NullPiece.instance #@sentinel 
    end 
  
  end
  
  def [](pos)
    row, col = pos
    @grid[row][col]
  end
  
  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end
  
  def valid_pos?(pos)
    row, col = pos 
    return false if row > 7 || row < 0
    return false if col > 7 || col < 0  
    true
  end 
end

