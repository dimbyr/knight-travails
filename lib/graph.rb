# import vertex
require_relative 'vertex'

# a knight graph
class KnightTravel
  attr_accessor :source, :destination

  def initialize(source, destination)
    @source = KnightNode.new(source)
    @destination = KnightNode.new(destination)
  end
end
