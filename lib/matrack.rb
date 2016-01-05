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
        response_handler(response, route, env)
        # r = response_handler(response, route, env)

        # if env["rack.request.cookie_hash"]
        #   cookie_hash = env["rack.request.cookie_hash"]
        #   r.set_cookie(cookie_hash.keys.first, cookie_hash.values)
        #   res = r.finish
        #   # require "pry"; binding.pry
        #   return res = r.finish
        # end
        # # require "pry"; binding.pry
        # return r

        # env["rack.session"].each { |s| r.set_cookie(s.first, s.last)}


        # return response_handler(response, route, env)
      else
        controller = BaseController.new(env)
        response = controller.invalid_route
        [404, {}, [response]]
      end
    end

    def response_handler(response, route, env)
      status = 200
      headers = { "Content-Type" => "text/html" }
      controller = route.matclass.new(env)
      # if response.is_a? String
      #   response
      # else
      #   controller.send(route.action)
      #   response = controller.render(route.action)
      # end

      # resp = Rack::Response.new response, status, headers
      return [status, headers, [response]] if response.is_a? String
      controller.send(route.action)
      response = controller.render(route.action)
      [status, headers, [response]]
    end
  end
end
