require "matrack/version"
require "matrack/utility"
require "matrack/dependencies"
require "matrack/route"
require "matrack/router"

module Matrack
  class Applciation
    attr_reader :router

    def initialize
      @router = Router.new
    end
  end
end
