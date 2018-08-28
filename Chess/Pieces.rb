require 'singleton'
require 'byebug'
require_relative 'Slideable'

class Piece 
  
  attr_accessor :color, :pos
  attr_reader :visual, :board
  
  def initialize(pos, board, color)
    @board = board
    @pos = pos
    @color = color
  end 
  
  def valid_move?(start_pos, end_pos)
    true
  end 
  
end

class Rook < Piece 
  include SlidingPiece
  
  def initialize(pos, board, color)
    # debugger
    super
    @visual = "♜"
  end
  
  def moves
    horizontal_dirs
  end
end 
# 
class Bishop < Piece 
  include SlidingPiece
  
  def initialize(pos, board, color)
    super
    @visual = "♝"
  end
  
  def moves
    diagonal_dirs
  end
end 

class Knight < Piece 
  def initialize(pos, board, color)
    super
    @visual = "♞"
  end
end

class King < Piece 
  def initialize(pos, board, color)
    super
    @visual = "♚"
  end
end

class Queen < Piece
   include SlidingPiece
   
  def initialize(pos, board, color)
    super
    @visual = "♛"
  end
  
  def moves
    diagonal_dirs + horizontal_dirs
  end
end

class Pawn < Piece 
  def initialize(pos, board, color)
    super
    @visual = "♟"
  end
end 
class NullPiece < Piece
  include Singleton
  def initialize
    super(nil,nil,nil)
    @visual = " "
  end
end

# Why do we need to store pos with in each piece 
# evaluating our board valid_move? logic 
# 