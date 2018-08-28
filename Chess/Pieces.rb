class Piece 
  
  attr_reader :color, :pos
  
  def initialize(color=nil)
    @color = color
  end 
  
  def valid_move?(start_pos, end_pos)
    true
  end 
  
end
class Rook < Piece 
  
  def move_dirs
  
  end 
  
end 
class Bishop < Piece 
end 
class Knight < Piece 
end
class King < Piece 
end
class Queen < Piece 
end
class Pawn < Piece 
end 
class NullPiece < Piece 
end

# Why do we need to store pos within each piece 
# evaluating our board valid_move? logic 
# 