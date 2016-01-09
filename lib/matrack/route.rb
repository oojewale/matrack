class Route
  attr_reader :matclass, :action, :mat_controller

  def initialize(route_info)
    matklass = route_info.last[:matclass].to_camel_case
    @matclass = Object.const_get(matklass+"Controller")
    @path = route_info.first
    @action = route_info.last[:method].to_sym
  end

  def execute(env)
    @mat_controller = matclass.new(env)
    @mat_controller.send(action)
  end
end
