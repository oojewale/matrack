require_relative "generator"
require_relative "mvc_gen"

module Matrack
  class GeneratorBase < MvcGen

    desc "server", "starts matrack server. Alias 's'"
    def server
      exec "rackup"
    end

    map ["server", "s"] => "server"
  end
end