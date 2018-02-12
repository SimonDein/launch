# Transpose 3x3
# Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the original matrix.
# Note that there is a Array#transpose method that does this -- you may not use it for this exercise.
# You also are not allowed to use the Matrix class from the standard library.
# Your task is to do this yourself.

# Take care not to modify the original matrix: you must produce a new matrix and leave the original matrix unchanged.

# solution 1
def transpose(arr) # transpose matrix
  column1, column2, column3 = [arr[0][0], arr[1][0], arr[2][0]],
                              [arr[0][1], arr[1][1], arr[2][1]],
                              [arr[0][2], arr[1][2], arr[2][2]]
  [column1, column2, column3]
end

# solution 2
def transpose(matrix)
  result = []
  (0..2).each do |col_idx|
    row = (0..2).map {|row_idx| matrix[row_idx][col_idx]}
    result << row
  end

  result
end

 
# tests
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]