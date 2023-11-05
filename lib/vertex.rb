# Vertex of a graph

class Vertex
  attr_accessor :data, :predecessor, :distance, :children

  def initialize(data = nil, children = [], predecessor = nil, distance = nil)
    @data = data
    @children = children
    @predecessor = predecessor
    distance = distance
  end

  def visited?
    !distance.nil?
  end

end
