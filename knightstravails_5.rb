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

class Node
  attr_accessor :value, :c_1, :c_2, :c_3, :c_4, :c_5, :c_6, :c_7, :c_8
  def initialize(coords)
    @value = coords
    @c_1 = nil
    @c_2 = nil
    @c_3 = nil
    @c_4 = nil
    @c_5 = nil
    @c_6 = nil
    @c_7 = nil
    @c_8 = nil
  end
end

def build_tree(start, final, i = 0)
  node = Node.new(start)
  return node if i == 6

  moves = find_legal_coordinates(node.value)
  puts "FOUND IT AFTER #{i + 1} steps" if moves.include?(final)
  return node if moves.include?(final)

  node.c_1 = build_tree(moves.shift, final, i + 1) unless moves.empty?

  node.c_2 = build_tree(moves.shift, final, i + 1) unless moves.empty?

  node.c_3 = build_tree(moves.shift, final, i + 1) unless moves.empty?

  node.c_4 = build_tree(moves.shift, final, i + 1) unless moves.empty?

  node.c_5 = build_tree(moves.shift, final, i + 1) unless moves.empty?

  node.c_6 = build_tree(moves.shift, final, i + 1) unless moves.empty?

  node.c_7 = build_tree(moves.shift, final, i + 1) unless moves.empty?

  node.c_8 = build_tree(moves.shift, final, i + 1) unless moves.empty?

  node
end

tree = build_tree([0, 0], [0, 2])
#p tree.value