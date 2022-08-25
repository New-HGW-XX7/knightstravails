$BOARD = [ # Not in use
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
def build_tree(start, final, tracker = [], d = 0)
  p "start: #{start}"
  tracker << start
  node = Node.new(start)
  
  legal_moves = find_legal_coordinates(start)
  tracker << final if legal_moves.include?(final)
  return p "LEGAL TARGET FOUND #{tracker} / steps needed: #{tracker.length - 1}" if legal_moves.include?(final)

  tracker.each { |visited| legal_moves.delete(visited) } unless tracker.empty?
  legal_moves = legal_moves.reverse if d = 1
  if legal_moves.empty?
    p 'out of legal moves'
    node.c_1 = build_tree(tracker[1], final, tracker = [], d = 1)
  else
    node.c_1 = build_tree(legal_moves[0], final, tracker) unless legal_moves[0].nil?
  end

  start
  tracker
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
  tracker
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
  tracker
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
  tracker
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
  tracker
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
  tracker
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
  tracker
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
  tracker
end
###
### End of list ###
###


def knight_moves(start, final)
  tree_1 = build_tree(start, final)
  tree_2 = build_tree_2(start, final)
  tree_3 = build_tree_3(start, final)
  tree_4 = build_tree_4(start, final)
  tree_5 = build_tree_5(start, final)
  tree_6 = build_tree_6(start, final)
  tree_7 = build_tree_7(start, final)
  tree_8 = build_tree_7(start, final)
  
  puts "\n tree1: #{tree_1}"
  puts "\n tree2: #{tree_2}"
  puts "\n tree3: #{tree_3}"
  puts "\n tree4: #{tree_4}"
  puts "\n tree5: #{tree_5}"
  puts "\n tree6: #{tree_6}"
  puts "\n tree7: #{tree_7}"
  puts "\n tree8: #{tree_8}"

  results = []
  results << tree_1 unless tree_1.length < 2
  results << tree_2 unless tree_2.length < 2
  results << tree_3 unless tree_3.length < 2
  results << tree_4 unless tree_4.length < 2
  results << tree_5 unless tree_5.length < 2
  results << tree_6 unless tree_6.length < 2
  results << tree_7 unless tree_7.length < 2
  results << tree_8 unless tree_8.length < 2

  results.sort_by! {|element| element.size }

  puts "Your path is: #{results[0]} and you need #{results[0].length - 1} steps"
end

knight_moves([0, 0], [0, 6])