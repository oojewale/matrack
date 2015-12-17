module Matrack
  class BaseController
    def initialize env
      @env = env
    end

    def render(view_name, locals = {})
      template = Tilt::ERBTemplate.new(File.join(File.dirname(__FILE__), "layout.erb"))
      title = view_name.to_s.gsub("_", " ").capitalize
      template.render(self, title: title) { Tilt::ERBTemplate.new(File.join("app", "views", controller_name, "#{view_name}.erb")).render(self, locals)}
    end

    def controller_name
      self.class.to_s.gsub(/Controller$/, "").to_snake_case
    end
  end
end