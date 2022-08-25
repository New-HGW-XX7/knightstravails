$BOARD = [
  [0, 1, 2, 3, 4, 5, 6, 7], # Row 0
  [8, 9, 10, 11, 12, 13, 14, 15], # Row 1
  [16, 17, 18, 19, 20, 21, 22, 23], # Row 2
  [24, 25, 26, 27, 28, 29, 30, 31], # Row 3
  [32, 33, 34, 35, 36, 37, 38, 39], # Row 4
  [40, 41, 42, 43, 44, 45, 46, 47], # Row 5
  [48, 49, 50, 51, 52, 53, 54, 55], # Row 6
  [56, 57, 58, 59, 60, 61, 62, 63] # Row 7
]


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
  def initialize(value)
    @value = value
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
###
### List of buid_tree functions ###
###
def build_tree(start, final, tracker = [])
  p "start: #{start}"
  tracker << start
  node = Node.new(start)
  
  legal_moves = find_legal_coordinates(start)
  tracker << final if legal_moves.include?(final)
  return p "LEGAL TARGET FOUND #{tracker} / steps needed: #{tracker.length - 1}" if legal_moves.include?(final)

  tracker.each { |visited| legal_moves.delete(visited) } unless tracker.empty?

  if legal_moves.empty?
    p 'out of legal moves'
    return
  else
    node.c_1 = build_tree(legal_moves[0], final, tracker) unless legal_moves[0].nil?
  end

  start
  #tracker return tracker to compare in main function
end

def build_tree_2(start, final, tracker = [])
  p "start: #{start}"
  tracker << start
  node = Node.new(start)
  
  legal_moves = find_legal_coordinates(start)
  tracker << final if legal_moves.include?(final)
  return p "LEGAL TARGET FOUND #{tracker} / steps needed: #{tracker.length - 1}" if legal_moves.include?(final)

  tracker.each { |visited| legal_moves.delete(visited) } unless tracker.empty?

  if legal_moves.empty?
    p 'out of legal moves'
    return
  else
    node.c_2 = build_tree(legal_moves[1], final, tracker) unless legal_moves[1].nil?
  end

  start
  #tracker return tracker to compare in main function
end

def build_tree_3(start, final, tracker = [])
  p "start: #{start}"
  tracker << start
  node = Node.new(start)
  
  legal_moves = find_legal_coordinates(start)
  tracker << final if legal_moves.include?(final)
  return p "LEGAL TARGET FOUND #{tracker} / steps needed: #{tracker.length - 1}" if legal_moves.include?(final)

  tracker.each { |visited| legal_moves.delete(visited) } unless tracker.empty?

  if legal_moves.empty?
    p 'out of legal moves'
    return
  else
    node.c_3 = build_tree(legal_moves[2], final, tracker) unless legal_moves[2].nil?
  end

  start
  #tracker return tracker to compare in main function
end

def build_tree_4(start, final, tracker = [])
  p "start: #{start}"
  tracker << start
  node = Node.new(start)
  
  legal_moves = find_legal_coordinates(start)
  tracker << final if legal_moves.include?(final)
  return p "LEGAL TARGET FOUND #{tracker} / steps needed: #{tracker.length - 1}" if legal_moves.include?(final)

  tracker.each { |visited| legal_moves.delete(visited) } unless tracker.empty?

  if legal_moves.empty?
    p 'out of legal moves'
    return
  else
    node.c_4 = build_tree(legal_moves[3], final, tracker) unless legal_moves[3].nil?
  end

  start
  #tracker return tracker to compare in main function
end

def build_tree_5(start, final, tracker = [])
  p "start: #{start}"
  tracker << start
  node = Node.new(start)
  
  legal_moves = find_legal_coordinates(start)
  tracker << final if legal_moves.include?(final)
  return p "LEGAL TARGET FOUND #{tracker} / steps needed: #{tracker.length - 1}" if legal_moves.include?(final)

  tracker.each { |visited| legal_moves.delete(visited) } unless tracker.empty?

  if legal_moves.empty?
    p 'out of legal moves'
    return
  else
    node.c_5 = build_tree(legal_moves[4], final, tracker) unless legal_moves[4].nil?
  end

  start
  #tracker return tracker to compare in main function
end

def build_tree_6(start, final, tracker = [])
  p "start: #{start}"
  tracker << start
  node = Node.new(start)
  
  legal_moves = find_legal_coordinates(start)
  tracker << final if legal_moves.include?(final)
  return p "LEGAL TARGET FOUND #{tracker} / steps needed: #{tracker.length - 1}" if legal_moves.include?(final)

  tracker.each { |visited| legal_moves.delete(visited) } unless tracker.empty?

  if legal_moves.empty?
    p 'out of legal moves'
    return
  else
    node.c_6 = build_tree(legal_moves[5], final, tracker) unless legal_moves[5].nil?
  end

  start
  #tracker return tracker to compare in main function
end

def build_tree_7(start, final, tracker = [])
  p "start: #{start}"
  tracker << start
  node = Node.new(start)
  
  legal_moves = find_legal_coordinates(start)
  tracker << final if legal_moves.include?(final)
  return p "LEGAL TARGET FOUND #{tracker} / steps needed: #{tracker.length - 1}" if legal_moves.include?(final)

  tracker.each { |visited| legal_moves.delete(visited) } unless tracker.empty?

  if legal_moves.empty?
    p 'out of legal moves'
    return
  else
    node.c_7 = build_tree(legal_moves[6], final, tracker) unless legal_moves[6].nil?
  end

  start
  #tracker return tracker to compare in main function
end

def build_tree_8(start, final, tracker = [])
  p "start: #{start}"
  tracker << start
  node = Node.new(start)
  
  legal_moves = find_legal_coordinates(start)
  tracker << final if legal_moves.include?(final)
  return p "LEGAL TARGET FOUND #{tracker} / steps needed: #{tracker.length - 1}" if legal_moves.include?(final)

  tracker.each { |visited| legal_moves.delete(visited) } unless tracker.empty?

  if legal_moves.empty?
    p 'out of legal moves'
    return
  else
    node.c_8 = build_tree(legal_moves[7], final, tracker) unless legal_moves[7].nil?
  end

  start
  #tracker return tracker to compare in main function
end
###
### End of list ###
###
def level_order(root, final = nil)
  values = []
  v_1 = [root.value]
  v_2 = [root.value]
  v_3 = [root.value]
  v_4 = [root.value]
  v_5 = [root.value]
  v_6 = [root.value]
  v_7 = [root.value]
  v_8 = [root.value]
  q = [root]
  puts "\n\n\n q from level_order: #{q} \n\n\n"

  until q.empty?
    values << q.first.value unless q.first.value.nil?
    #break if values.last == final

    v_1 << q.first.c_1.value unless q.first.c_1.nil?
    v_2 << q.first.c_2.value unless q.first.c_2.nil?
    # v_3 << q.first.c_3.value unless q.first.c_3.nil?
    # v_4 << q.first.c_4.value unless q.first.c_4.nil?
    # v_5 << q.first.c_5.value unless q.first.c_5.nil?
    # v_6 << q.first.c_6.value unless q.first.c_6.nil?
    # v_7 << q.first.c_7.value unless q.first.c_7.nil?
    # v_8 << q.first.c_8.value unless q.first.c_8.nil?
    # Check if values contains final coords
    q << q.first.c_1 unless q.first.c_1.nil?
    q << q.first.c_2 unless q.first.c_2.nil?
    # q << q.first.c_3 unless q.first.c_3.nil?
    # q << q.first.c_4 unless q.first.c_4.nil?
    # q << q.first.c_5 unless q.first.c_5.nil?
    # q << q.first.c_6 unless q.first.c_6.nil?
    # q << q.first.c_7 unless q.first.c_7.nil?
    # q << q.first.c_8 unless q.first.c_8.nil?
    q.shift

  end
  puts "values from level_order: #{values}"
  puts "HERE IT IS" if values.compact.include?([5, 7])
  puts values.length
  puts "v_1: #{v_1.compact}"
  puts "v_2: #{v_2.compact}"
  # puts "v_3: #{v_3.compact}"
  # puts "v_4: #{v_4.compact}"
  # puts "v_5: #{v_5.compact}"
  # puts "v_6: #{v_6.compact}"
  # puts "v_7: #{v_7.compact}"
  # puts "v_8: #{v_8.compact}"
end

def knight_moves(start, final)
  #start_node = Node.new(start)
  #creates two nodes and passes to build tree
  #node.value is coords
  tree_1 = build_tree(start, final)
  puts "Tree 1 above\n\n"
  #puts "Final Tree according to knight_moves"
  #p tree
  
  tree_2 = build_tree_2(start, final)
  tree_3 = build_tree_3(start, final)
  tree_4 = build_tree_4(start, final)
  tree_5 = build_tree_5(start, final)
  tree_6 = build_tree_6(start, final)
  tree_7 = build_tree_7(start, final)
  tree_8 = build_tree_7(start, final)
  #p tree2
end

knight_moves([0, 0], [7, 7])