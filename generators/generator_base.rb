require "rack"
require "rack/handler/puma"
require_relative "generator"
require_relative "mvc_gen"

module Matrack
  class GeneratorBase < MvcGen

    # desc "method[server]", "starts matrack server. Alias 's'"
    # def server
    #   Rack::Handler::Puma.run Matrack::Application.new, Port: 3009
    # end

    # map ["server", "s"] => "server"
  end
end