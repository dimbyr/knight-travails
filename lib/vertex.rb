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

  def get_neighbors(dataxy)
    return if dataxy.nil?

    i, j = dataxy
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

# Pawn Node
class PawnNode < Node
  attr_accessor :has_moved

  def initialize(data)
    super
    @neighbors = get_neighbors(data)
    @has_moved = false
  end

  def get_neighbors(dataxy)
    i, j = dataxy
    neighs = []
    onemove = j + 1
    twomoves = j + 2
    neighs << onemove if onemove < 8
    neighs << twomoves if twomoves < 8 && !@has_moved
    neighs
  end
end
