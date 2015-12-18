class Route
  attr_accessor :matclass, :path, :action

  def initialize route_array
    @matclass = route_array.last[:matclass]
    @path = route_array.first
    @action = route_array.last[:method].to_sym
  end

  def get_matclass
    Object.const_get("#{matclass}Controller")
  end

  def execute(env)
    get_matclass.new(env).send(action)
  end
end
