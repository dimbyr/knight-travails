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

# Pawn Moves
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

# King Moves
class KingNode < Node
  # attr_accessor :has_moved

  def initialize(data)
    super
    @neighbors = get_neighbors(data)
    # @has_moved = false
  end

  def get_neighbors(dataxy)
    i, j = dataxy
    i_moves = [i, i + 1, i - 1].select { |x| x.between?(0, 7) }
    j_moves = [j, j + 1, j - 1].select { |y| y.between?(0, 7) }
    neighs = i_moves.product(j_moves)
    neighs.delete([i, j])
    neighs
  end
end

data = [3, 3]
king = KingNode.new(data)
puts "Neighbors of King #{data}"
p king.neighbors


# A bishop node
class BishopNode < Node
  # attr_accessor :has_moved

  def initialize(data)
    super
    @neighbors = get_neighbors(data)
  end

  def get_neighbors(dataxy)
    i, j = dataxy
    moves = (1..7).to_a
    neighs = moves.reduce([]) do |neigh_list, mv|
      x_left = i - mv
      x_right = i + mv
      y_up = j + mv
      y_down = j - mv
      neigh_list + [[x_right, y_up], [x_left, y_up], [x_right, y_down], [x_left, y_down]]
    end
    neighs.select { |x, y| x.between?(0, 7) && y.between?(0, 7) }
  end
end

# data = [3, 3]
# bishop = BishopNode.new(data)
# puts "Neighbors of Bishop #{data}"
# p bishop.neighbors
