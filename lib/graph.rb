# frozen_string_litteral: true

require_relative 'vertex'

# a knight graph
class KnightBoard
  attr_accessor :board

  def initialize
    @board = build_board
  end

  def build_board
    b = [[nil] * 8] * 8
    b.map!.with_index do |valx, idx|
      valx.map.with_index do |_, idy|
        KnightNode.new([idx, idy])
      end
    end
    b
  end

  # Knights moves
  def knight_moves(source, dest, board = @board)
    queue = [init_source(source, board)]
    s = queue[0]
    until s.data == dest
      s = queue.first
      assign_neighbors(s, queue, board)
      queue.shift
    end
    puts "You made #{source} ==> #{dest} in #{s.distance} steps!"
    puts source.to_s + path_print(s)
  end

  # BFS
  def level_order(source, board = @board)
    res = []
    queue = [init_source(source, board)]
    until queue.empty?
      s = queue.first
      collect_result(s, queue, board, res)
      queue.shift
    end
    res
  end

  private

  def path_print(node)
    return '' if node.predecessor.nil?

    path_print(node.predecessor) + "-->#{node.data}"
  end

  def collect_result(source, queue, board, res)
    data = source.data
    dist = source.distance
    assign_neighbors(source, queue, board)
    res << [data, dist]
  end

  def init_source(source, board)
    x, y = source
    s = board[x][y]
    s.distance = 0
    s.predecessor = nil
    s
  end

  def assign_neighbors(source, queue, board)
    source.neighbors.each do |x, y|
      node = board[x][y]
      next if node.distance

      node.predecessor = source if node.predecessor.nil?
      node.distance = source.distance + 1
      queue << node
    end
  end
end
