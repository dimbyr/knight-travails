# import vertex
require_relative 'vertex'

# a knight graph
class KnightBoard
  attr_accessor :board

  def initialize
    @board = [[nil] * 8] * 8
    build_board
  end

  def build_board
    (0..7).each do |lin|
      (0..7).each do |col|
        node = KnightNode.new([lin, col])
        @board[lin][col] = node
      end
    end
  end
end

# # knight shortest path
# class KnightTravel
#   attr_accessor :source, :destination

#   def initialize(source, destination)
#     @source = KnightNode.new(source)
#     @destination = KnightNode.new(destination)
#   end

#   def level_order(node = @source)
#     # BFS
#   end

#   def enqueue(node, lst)
#     lst << node
#     node.neighbors.each do |child|
#       lst << child if child.distance
#     end
#   end
# end

board = KnightBoard.new

p board.board
