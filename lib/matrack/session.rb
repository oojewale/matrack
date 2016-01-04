module Matrack
  class Session
    attr_accessor :request
    # session keys are accessed and stored as symbols
    def initialize(env)
      @request = Rack::Request.new(env)
    end

    def [](key)
      request.session[key.to_sym]
    end

    def []=(key, value)
      request.session[key.to_sym] = value
      # env["rack.session"]
        # require "pry"; binding.pry
      request.cookies[key.to_sym] = value
    end
  end
end