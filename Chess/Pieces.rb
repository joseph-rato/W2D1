require 'singleton'
class Piece 
  
  attr_accessor :color, :pos
  attr_reader :visual
  
  def initialize(pos=nil, color=nil)
    @pos = pos
    @color = color
  end 
  
  def valid_move?(start_pos, end_pos)
    true
  end 
  
end
class Rook < Piece 
  
  def initialize(pos=nil, color=nil)
    super
    @visual = "♜"
  end
  
end 

class Bishop < Piece 
  def initialize(pos=nil, color=nil)
    super
    @visual = "♝"
  end
end 

class Knight < Piece 
  def initialize(pos=nil, color=nil)
    super
    @visual = "♞"
  end
end

class King < Piece 
  def initialize(pos=nil, color=nil)
    super
    @visual = "♚"
  end
end

class Queen < Piece 
  def initialize(pos=nil, color=nil)
    super
    @visual = "♛"
  end
end

class Pawn < Piece 
  def initialize(pos=nil, color=nil)
    super
    @visual = "♟"
  end
end 
class NullPiece < Piece
  include Singleton
  def initialize(pos=nil, color=nil)
    super
    @visual = " "
  end
end

# Why do we need to store pos within each piece 
# evaluating our board valid_move? logic 
# 