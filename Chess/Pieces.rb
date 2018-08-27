class Piece 
  
  attr_reader :color
  
  def initialize(color=nil)
    @color = color
  end 
  
end
class Rook < Piece 
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