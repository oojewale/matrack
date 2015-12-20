require "matrack/version"
require "matrack/utility"
require "matrack/dependencies"
require "matrack/base_model"
require "matrack/base_controller"
require "matrack/route"
require "matrack/router"

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
      controller = route.get_matclass.new(env)
      return [status, headers, [response]] if response.is_a? String
      controller.send(route.action)
      response = controller.render(route.action)
      [status, headers, [response]]
    end
  end
end
