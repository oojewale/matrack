require_relative "resources"

module Matrack
  class Application
    attr_reader :router

    def initialize
      @router = Router.new
    end

    def call(env)
      route = router.route_for(env)
      if route
        response = route.execute(env)
        return response_handler(response, route, env)
      else
        [404, {}, ["Invalid route specified"]]
      end
    end

    def response_handler(response, route, env)
      status = 200
      headers = { "Content-Type" => "text/html" }
      controller = route.matclass.new(env)
      return [status, headers, [response]] if response.is_a? String
      controller.send(route.action)
      response = controller.render(route.action)
      [status, headers, [response]]
    end
  end
end
