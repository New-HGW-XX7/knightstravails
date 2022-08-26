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

class Tree # Really needed?
  attr_accessor :root
  def initialize(node)
    @root = node
  end
end

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
    #@children = [@c_1, @c_2, @c_3, @c_4, @c_5, @c_6, @c_7, @c_8]
  end
end

def build_tree(start, final, i = 0, parent = nil)
  node = Node.new(start)
  node.parent = parent
  return node if i == 6

  moves = find_legal_coordinates(node.value)
  #puts "FOUND IT AFTER #{i + 1} steps" if moves.include?(final)
  #return node if moves.include?(final)

  puts "FOUND IT AFTER #{i} steps" if node.value == final
  
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



tree = build_tree([3, 3], [7, 7])

bfs(tree, [7, 7])










# def level(tree, start, final)
#   q = []
#   r_1 = [start]
#   r_2 = [start]
#   r_3 = [start]
#   r_4 = [start]
#   r_5 = [start]
#   r_6 = [start]
#   r_7 = [start]
#   r_8 = [start]

#   q << tree.c_1
#   q << tree.c_2
#   #p q

#   q << tree.c_3
#   # q << tree.c_4
#   # q << tree.c_5
#   # q << tree.c_6
#   # q << tree.c_7
#   # q << tree.c_8
#   # If needed, check for c_x.values here and determine if one is final

#   status = false
#   i = 1
#   moves = []
#   until status == true or i == 5
#     q.first.c_1.nil? ? moves << nil : moves << q.first.c_1.value unless q.first.nil?
#     q.first.c_2.nil? ? moves << nil : moves << q.first.c_2.value unless q.first.nil?
#     q.first.c_3.nil? ? moves << nil : moves << q.first.c_3.value unless q.first.nil?

#     p "moves on interation #{i}: #{moves}"
#     if moves.include?(final)
#       puts "FOUND IT"
#       case i
#         when 1
#         r_1 << q.first.value unless q.first.nil?
#         r_1 << final
#         when 2
#         r_2 << q.first.value unless q.first.nil?
#         r_2 << final
#         when 3
#         r_3 << q.first.value
#         r_3 << final
#       end
#       status = true
#     else
#         case i
#         when 1 then r_1 << q.first.value 
#         when 2 then r_2 << q.first.value 
#         when 3 then r_3 << q.first.value unless moves.compact.empty?
#         end
#     end

#     q << q.first.c_1 unless q.first.nil?
#     q << q.first.c_2 unless q.first.nil?
#     q << q.first.c_3 unless q.first.nil?

#     i += 1
#     i = 1 if i == 9
#     moves = []
#     q.shift
    
#   end
#   puts "r1: #{r_1}"
#   puts "r2: #{r_2}"
#   puts "r3: #{r_3}"
# end

# #p tree.root.c_1

# level(tree, [0, 0], [3, 6])