module SteppingPiece
  
  def moves
    results = []
    self.move_diffs.each do |movement|
      
      x,y = self.pos 
       
        x += movement[0]
        y += movement[1]
        
        next if (x > 7 || x < 0) || (y > 7 || y < 0)
        next if self.board[[x,y]].color == self.color 
        results << [x,y] 
    end 
    results
  end
end