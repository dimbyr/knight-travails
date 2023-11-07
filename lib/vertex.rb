# Vertex of a graph
class Node
  attr_accessor :data, :neighbors, :predecessor, :distance, :children

  def initialize(data = nil)
    @data = data
    @neighbors = []
    @children = []
    @predecessor = nil
    @distance = nil
  end

  def visited?
    !distance.nil?
  end
end

# A knight node
class KnightNode < Node
  def initialize(data = nil)
    super
    @neighbors = get_neighbors(data)
  end

  def get_neighbors(data)
    return if data.nil?

    i, j = data
    where_to = [[2, 1], [2, -1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [1, -2], [-1, -2]]
    neighbors = []
    where_to.each do |a, b|
      x = i + a
      y = j + b
      neighbors << [x, y] if x.between?(0, 7) && y.between?(0, 7)
    end
    neighbors
  end
end

# pos = [7, 7]
# knight = KnightNode.new(pos)
# puts "#{pos} has #{knight.neighbors.length} neighbors"
# p knight.neighbors
