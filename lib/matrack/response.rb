# module Matrack
#   class Response
#     def rack_response(body, status = 200, headers = {})
#       @rack_response = Rack::Response.new(body, status, headers)
#     end

#     def render_template(view_name, locals = {}, controller_name)
#       template = Tilt::ERBTemplate.new(File.join(File.dirname(__FILE__), "layout.erb"))
#       title = view_name.to_s.gsub("_", " ").capitalize
#       template.render(self, title: title) { Tilt::ERBTemplate.new(File.join("app", "views", controller_name, "#{view_name}.erb")).render(self, locals)}
#     end

#   end
# end