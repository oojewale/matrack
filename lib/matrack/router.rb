class Router
  attr_reader :routes

  def initialize
    @routes = Hash.new { |hash, key| hash[key] = [] }
  end

  def draw(&block)
    instance_eval(&block)
  end

  def root(root_path)
    get "/", root_path
  end

  %w(get post put delete).each do |request_type|
    define_method(request_type) do | path, options|
      request_type = request_type.to_sym
      if options.is_a? Hash
        @routes[request_type] << [path, case_parser(options[:to])]
      else
        @routes[request_type] << [path, case_parser(options)]
      end
    end
  end

  def route_for(env)
    path = env["PATH_INFO"]
    verb = env["REQUEST_METHOD"].downcase.to_sym
    route_info = routes[verb].detect do |route|
      route.first == (path =~ /^[\/]+[\w]/ ? path.sub("/", "") : path)
    end
    Route.new(route_info) if route_info
  end

  private

  def case_parser(str)
    matclass, method = str.split("#")
    { matclass: matclass.to_camel_case, method: method.to_snake_case }
  end
end
