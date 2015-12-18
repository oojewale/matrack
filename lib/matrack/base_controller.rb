module Matrack
  class BaseController
    attr_reader :request
    def initialize env
      # @env = env
      # @response = Response.new
      @request = Rack::Request.new env
    end

    def params
      request.params
    end

    # def render(*args)
    #   args << controller_name
    #   @response_obj = @response.rack_response(@response.render_template(*args))
    #     @response_obj.body
    # end

    def render(view_name, locals = {})
      unless locals.empty?
        render_template(view_name, locals)
      else
        render_template(view_name)
      end
    end

    def render_template(view_name, locals = {})
      template = Tilt::ERBTemplate.new(File.join(File.dirname(__FILE__), "layout.erb"))
      title = view_name.to_s.gsub("_", " ").capitalize
      template.render(self, title: title) { Tilt::ERBTemplate.new(File.join("app", "views", controller_name, "#{view_name}.erb")).render(self, locals)}
    end


    def controller_name
      self.class.to_s.gsub(/Controller$/, "").to_snake_case
    end

  end
end
