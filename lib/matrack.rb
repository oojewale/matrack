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
        route.execute(env)
        response_handler(route)
      else
        controller = BaseController.new(env)
        body = controller.invalid_route
        [404, {}, [body]]
      end
    end

    def response_handler(route)
      controller = route.mat_controller
      if controller.response
        controller.response
      else
        controller.render(route.action)
      end
    end
  end
end
