class Route
  attr_reader :matclass, :action

  def initialize(route_array)
    str_matclass = route_array.last[:matclass].to_camel_case
    @matclass = Object.const_get(str_matclass+"Controller")
    @path = route_array.first
    @action = route_array.last[:method].to_sym
  end

  def execute(env)
    matclass.new(env).send(action)
  end
end
