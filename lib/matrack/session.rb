module Matrack
  class Session
    attr_accessor :request

    def initialize(env)
      @request = Rack::Request.new(env)
    end

    def [](key)
      request.session[key.to_sym]
    end

    def []=(key, value)
      request.session[key.to_sym] = value
    end

    def clear
      request.session.clear
    end
  end
end