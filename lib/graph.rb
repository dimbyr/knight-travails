# import vertex
require_relative 'vertex'

# a knight graph
class KnightBoard
  attr_accessor :board

  def initialize
    @board = build_board
  end

  def build_board
    # (0..7).each do |lin|
    #   (0..7).each do |col|
    #     node = KnightNode.new([lin, col])
    #     @board[lin][col] = node
    #   end
    # end
    b = [[nil] * 8] * 8
    b.map!.with_index do |valx, idx|
      valx.map.with_index do |valy, idy|
        KnightNode.new([idx, idy])
      end
    end
    b
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

def levels(source, board)
  return if source.nil?

  res = []
  x, y = source
  s = board[x][y]
  p s.data, s.neighbors
  puts '=' * 20
  s.distance = 0
  s.predecessor = nil
  queue = [s]
  until queue.empty?
    s = queue.first
    s.neighbors.each do |x, y|
      node = board[x][y]
      node.predecessor = s.data if node.predecessor.nil?
      next if node.distance

      node.distance = s.distance + 1
      queue << node
    end
    res << [s.data, s.distance]
    queue.shift
    p "#{source} -- #{s.data} distance #{s.distance}"
  end
  res
end

board = KnightBoard.new
# puts board.board[3][3].data
levels([3, 3], board.board)
