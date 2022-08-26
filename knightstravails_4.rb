def find_legal_coordinates(pos = start)
  results = []
  results << [pos[0] + 1, pos[1] + 2] unless pos[0] + 1 > 7 or pos[1] + 2 > 7
  results << [pos[0] + 1, pos[1] - 2] unless pos[0] + 1 > 7 or pos[1] - 2 < 0
  
  results << [pos[0] + 2, pos[1] + 1] unless pos[0] + 2 > 7 or pos[1] + 1 > 7
  results << [pos[0] + 2, pos[1] - 1] unless pos[0] + 2 > 7 or pos[1] - 1 < 0
  
  results << [pos[0] - 1, pos[1] + 2] unless pos[0] - 1 < 0 or pos[1] + 2 > 7
  results << [pos[0] - 1, pos[1] - 2] unless pos[0] - 1 < 0 or pos[1] - 2 < 0
  
  results << [pos[0] - 2, pos[1] + 1] unless pos[0] - 2 < 0 or pos[1] + 1 > 7
  results << [pos[0] - 2, pos[1] - 1] unless pos[0] - 2 < 0 or pos[1] - 1 < 0
  
  results
end

def build_tree(start, final, tracker = [])
  p "start: #{start}"
  tracker << start
  return true if s > 7

  
  legal_moves = find_legal_coordinates(start)

  #return tracker if tracker.include?(final)
  tracker << final if legal_moves.include?(final)
  return p "LEGAL TARGET FOUND #{tracker} / steps needed: #{s}" if legal_moves.include?(final)
  tracker.each { |visited| legal_moves.delete(visited) } unless tracker.empty?

  if build_tree(legal_moves.first, final, tracker, s + 1) == true
    build_tree(legal_moves.last, final, tracker = [], s + 1)
  end
end

def build_tree_2(start, final, tracker = [], s = 1)
  return p tracker if s > 6
  p "start: #{start}"
  tracker << start

  
  legal_moves = find_legal_coordinates(start)
  puts "legal moves: #{legal_moves}"

  #return tracker if tracker.include?(final)
  tracker << final if legal_moves.include?(final)
  return p "LEGAL TARGET FOUND #{tracker} / steps needed: #{s}" if legal_moves.include?(final)
  tracker.each { |visited| legal_moves.delete(visited) } unless tracker.empty?

  build_tree_2(legal_moves.last, final, tracker, s + 1)
end


build_tree([0, 0], [0, 7])
#build_tree_2([0, 0], [7, 6])
