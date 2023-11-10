# frozen_string_litteral: true

require_relative 'lib/graph'

board = KnightBoard.new
board.knight_moves([3, 3], [4, 3])

# You made it in 3 steps
# [3, 3]-->[5, 4]-->[3, 5]-->[4, 3]