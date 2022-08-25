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
  results << [pos[0] + 1, pos[1] + 2] unless pos[0] + 1 > 8 or pos[1] + 2 > 8
  results << [pos[0] + 1, pos[1] - 2] unless pos[0] + 1 > 8 or pos[1] - 2 < 0
  
  results << [pos[0] + 2, pos[1] + 1] unless pos[0] + 2 > 8 or pos[1] + 1 > 8
  results << [pos[0] + 2, pos[1] - 1] unless pos[0] + 2 > 8 or pos[1] - 1 < 0
  
  results << [pos[0] - 1, pos[1] + 2] unless pos[0] - 1 < 0 or pos[1] + 2 > 8
  results << [pos[0] - 1, pos[1] - 2] unless pos[0] - 1 < 0 or pos[1] - 2 < 0
  
  results << [pos[0] - 2, pos[1] + 1] unless pos[0] - 2 < 0 or pos[1] + 1 > 8
  results << [pos[0] - 2, pos[1] - 1] unless pos[0] - 2 < 0 or pos[1] - 1 < 0
  
  p results
end

def build_tree(start, goal, tracker = [], i = 0)

  tracker << start # Add start to tracker
  p tracker
  return p "match. path: #{tracker}" if start == goal or i == 10 # Return if start = goal 


  accessible_fields = find_legal_coordinates(start) # Create array with accessible fields
  accessible_fields.each { |el| accessible_fields.delete(el) if tracker.include?(el) }
  p tracker
  #accessible_fields.each { |field| build_tree(field, goal, tracker) } # For each element recurse(element, goal, tracker) - Exclude tracker.last
  #p build_tree(accessible_fields[0], goal, tracker)
  p1 = build_tree(accessible_fields[0], goal, tracker, i + 1)
  #p2 = build_tree(accessible_fields[3], goal, tracker, i + 1) unless accessible_fields[3].nil?
end


def knight_moves(start, goal)
  
  
end

#find_legal_coordinates([4, 3])
#build_tree([4, 3], [5, 5])

def q_search(start, goal)
  q = find_legal_coordinates(start)
  return if q.include?(goal)
  until q.empty?
    p build_tree(q.first, goal)
    q.shift
  end
end


q_search([4, 3], [1, 0])

###
# DO USE NODES
# Give them coords as values
# Find out legal moves for each node
# Exclude fields upstream from being created as new nodes (?)
# Maximum 6 levels deep
###