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

def build_tree(start, goal, trackerarray)
  # Add start to tracker
  # Return if start = goal node
  # Array 0..63 - rootnumber
  # Create array with accessible fields
  # For each element recurse(element, goal, tracker)
end

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

find_legal_coordinates([4, 3])