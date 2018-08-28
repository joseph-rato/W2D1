require 'byebug'

module SlidingPiece
  DIAGONAL_DIRs = [
    [1,1],
    [1,-1],
    [-1,1],
    [-1,-1]
  ]
  HORIZONTAL_DIRS = [
    [0,1],
    [1,0],
    [-1,0],
    [0,-1]
  ]
  def horizontal_dirs 
    results = []
    HORIZONTAL_DIRS.each do |movement|
      # byebug
      x,y = self.pos 
      while true 
        x += movement[0]
        y += movement[1]
        break if (x > 7 || x < 0) || (y > 7 || y < 0)
        if self.board[[x, y]].color != self.color && self.board[[x, y]].class != NullPiece 
          results << [x,y]
          break 
        elsif self.board[[x,y]].color == self.color 
          break
        else   
          results << [x,y]
        end 
        # grow_unblocked_moves_in_dir
      end 
    end 
    results 
  end
   
  def diagonal_dirs 
    results = []
    DIAGONAL_DIRs.each do |movement|
      # byebug
      x,y = self.pos 
      while true 
        x += movement[0]
        y += movement[1]
        break if (x > 7 || x < 0) || (y > 7 || y < 0)
        if self.board[[x, y]].color != self.color && self.board[[x, y]].class != NullPiece 
          results << [x,y]
          break 
        elsif self.board[[x,y]].color == self.color 
          break
        else   
          results << [x,y]
        end 
        # grow_unblocked_moves_in_dir
      end 
    end 
    results 
  end 
  
  # def moves
  #   if horizontal == true
  #     horizontal_dirs
  #   elsif diagonal == true
  #     diagonal_dirs
  #   end 
  # 
  #   horizontal_dirs + diagonal_dirs
  # end 
  
  # def grow_unblocked_moves_in_dir(dx, dy)
  #   if self.board[[x, y]].color != self.color && self.board[[x, y]].class != NullPiece 
  #     results << [x,y]
  #     break 
  #   elsif self.board[[x,y]].color == self.color 
  #     break
  #   else   
  #     results << [x,y]
  #   end 
  # end
  
end 