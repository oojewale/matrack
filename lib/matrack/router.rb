class Router
  attr_reader :routes

  def initialize
    @routes = Hash.new { |hash, key| hash[key] = [] }
  end

  def draw &block
    instance_eval &block
  end

  def get path, options = {}
    @routes[:get] << [path, case_parser(options[:to])]
  end

  def post path, options = {}
    @routes[:post] << [path, case_parser(options[:to])]
  end

  def put path, options = {}
    @routes[:put] << [path, case_parser(options[:to])]
  end

  def delete path, options = {}
    @routes[:delete] << [path, case_parser(options[:to])]
  end

  def route_for env
    path = env["PATH_INFO"]
    verb = env["REQUEST_METHOD"].downcase
    invalid_route = ["/404", {:matclass=>"Base", :method=>"not_found"}]
    route_array = routes[verb].detect do | route |
      case route.first
      when String
        path == route.first
      when Regexp
        path =~ route.first
      end
    end
    return Route.new route_array if route_array
    Route.new invalid_route
  end

  private

  def case_parser str
    matclass, method = str.split("#")
    { matclass: matclass.to_camel_case, method: method.to_snake_case }
  end
end