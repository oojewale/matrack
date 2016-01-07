class Route
  attr_reader :matclass, :action, :mat_controller

  def initialize(route_array)
    str_matclass = route_array.last[:matclass].to_camel_case
    @matclass = Object.const_get(str_matclass+"Controller")
    @path = route_array.first
    @action = route_array.last[:method].to_sym
  end

  def execute(env)
    @mat_controller = matclass.new(env)
    @mat_controller.send(action)
  end
end
