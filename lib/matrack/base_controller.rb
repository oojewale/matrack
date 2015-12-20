module Matrack
  class BaseController
    attr_reader :request
    def initialize env
      @request = Rack::Request.new env
    end

    def params
      request.params
    end

    def render(view_name, locals = {})
      template = Tilt::ERBTemplate.new(File.join("app", "views", "layout", "application.html.erb"))
      title = view_name.to_s.gsub("_", " ").capitalize
      template.render(self, title: title) { Tilt::ERBTemplate.new(File.join("app", "views", controller_name, "#{view_name}.erb")).render(self, locals.merge!(get_instance_vars))}
    end

    def get_instance_vars
      vars = {}
      instance_variables.each do | var |
        key = var.to_s.gsub("@","").to_sym
        vars[key] = instance_variable_get(var)
      end
      vars
    end

    def controller_name
      self.class.to_s.gsub(/Controller$/, "").to_snake_case
    end
  end
end
