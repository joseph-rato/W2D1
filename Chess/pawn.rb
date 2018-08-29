require_relative 'Pieces' 
require 'byebug'

class Pawn < Piece 
  def initialize(pos, board, color)
    super
    @visual = "♟"
  end
  
  def at_start_row?
    return true if self.pos[0] == 1 && self.color == :black
    return true if self.pos[0] == 6 && self.color == :white
    false
  end
  
  def forward_dir
    return 1 if self.color == :black
    return -1 if self.color == :white
  end
  
  def forward_steps
    debugger
    results = []
    
    if at_start_row?
      x,y = self.pos
      y += 2 * forward_dir
      if self.board[[x, y]].class == NullPiece
        results << [x, y] 
      end
    end
    
    x,y = self.pos
    y += (forward_dir * 1)
    
    if self.board[[x, y]].class == NullPiece
       results << [x, y]
    end
    
    results
  end
  
  def side_attacks
    results = []
    
    [[1,1],[-1,-1],[1,-1],[-1,1]].each do |pos1|
      x, y = self.pos
      x2, y2 = pos1
      if forward_dir == y2
        x += x2
        y += y2
        if self.board[[x, y]].color != self.color && 
          self.board[[x, y]].class != NullPiece 
          results << [x, y]
        end
      end
    end 
    results
  end
  
  def moves 
    forward_steps + side_attacks
  end 
  
end