require "matrack/version"
require "matrack/utility"
require "matrack/dependencies"
require "matrack/base_model"
require "matrack/response"
require "matrack/base_controller"
require "matrack/route"
require "matrack/router"

module Matrack
  class Application
    attr_reader :router

    def initialize
      @router = Router.new
    end

    def call env
      route = MatrackApp.router.route_for env
      if route

        response = route.execute env
        status = 200
        headers = {"Content-Type" => "text/html"}
        [status, headers, [response]]
      else
        [404, {}, ["Invalid route specified"]]
      end
    end

  end
end
