class Node
  attr_accessor :value, :c_1, :c_2, :c_3, :c_4, :c_5, :c_6, :c_7, :c_8, :parent
  def initialize(coords)
    @value = coords
    @parent = nil
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

def find_legal_coordinates(pos)
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

def build_tree(start, final, i = 0, parent = nil)
  node = Node.new(start)
  node.parent = parent
  return node if i == 6

  moves = find_legal_coordinates(node.value)

  puts "FOUND IT AFTER #{i} STEPS" if node.value == final  
  return node if node.value == final

  node.c_1 = build_tree(moves.shift, final, i + 1, node) unless moves.empty?
  
  node.c_2 = build_tree(moves.shift, final, i + 1, node) unless moves.empty?

  node.c_3 = build_tree(moves.shift, final, i + 1, node) unless moves.empty?

  node.c_4 = build_tree(moves.shift, final, i + 1, node) unless moves.empty?

  node.c_5 = build_tree(moves.shift, final, i + 1, node) unless moves.empty?

  node.c_6 = build_tree(moves.shift, final, i + 1, node) unless moves.empty?

  node.c_7 = build_tree(moves.shift, final, i + 1, node) unless moves.empty?

  node.c_8 = build_tree(moves.shift, final, i + 1, node) unless moves.empty?
  
  node
end

def bfs(tree, final)
  q = [tree]
  target = nil

  found = false
  until found == true
    if q.first.value == final
      target = q.first
      found = true
    else
      q << q.first.c_1 unless q.first.c_1.nil?
      q << q.first.c_2 unless q.first.c_2.nil?
      q << q.first.c_3 unless q.first.c_3.nil?
      q << q.first.c_4 unless q.first.c_4.nil?
      q << q.first.c_5 unless q.first.c_5.nil?
      q << q.first.c_6 unless q.first.c_6.nil?
      q << q.first.c_7 unless q.first.c_7.nil?
      q << q.first.c_8 unless q.first.c_8.nil?
    end
    q.shift
  end

  path = []
  until target.value == tree.value
    path.unshift(target.value)
    target = target.parent
  end
  path.unshift(tree.value)
  
  puts "You made it in #{path.length - 1} steps."
  puts "Your path is #{path}"
end

def knight_moves(start, final)
  tree = build_tree(start, final)
  bfs(tree, final)
end

knight_moves([0, 0], [4, 3])