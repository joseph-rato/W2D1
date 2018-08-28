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
        results << [x,y]
      end 
    end 
    results
  end
   
  def diagonal_dirs 
  end 
  def moves 
  end 
  def grow_unblocked_moves_in_dir(dx, dy)
  end
end 