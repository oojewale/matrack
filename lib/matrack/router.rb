class Router
  attr_reader :routes

  def initialize
    @routes = Hash.new { |hash, key| hash[key] = [] }
  end

  def draw &block
    instance_eval &block
  end

  def get path, options = {}
    @@routes[:get] << [path]
  end
end