module Matrack
  class BaseController
    include Matrack::HelperTags
    attr_reader :request
    attr_accessor :session

    def initialize(env)
      @request = Rack::Request.new(env)
      @session = Session.new(env)
    end

    def params
      request.params
    end

    def render(view_name, locals = {})
      template = Tilt::ERBTemplate.new(File.join(APP_PATH, "app", "views",
                                       "layout", "application.html.erb"))
      title = view_name.to_s.tr("_", " ").capitalize
      view = "#{view_name}.html.erb"
      view_template = Tilt::ERBTemplate.new(File.join(APP_PATH, "app", "views",
                                                      controller_name, view))
      template.render(self, title: title) do
        view_template.render(self, locals.merge!(get_instance_vars))
      end
    end

    def invalid_route
      template = Tilt::ERBTemplate.new(File.join(APP_PATH, "app", "views",
                                                 "layout", "invalid.html.erb"))
      template.render(self)
    end

    def get_instance_vars
      vars = {}
      instance_variables.each do |var|
        key = var.to_s.delete("@").to_sym
        vars[key] = instance_variable_get(var)
      end
      vars
    end

    def controller_name
      self.class.to_s.gsub(/Controller$/, "").to_snake_case
    end

    def authenticate(password)
      Matrack::DataManger.password_hash(password)
    end
  end
end
