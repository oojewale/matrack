require "matrack"

def required_paths
  [
    File.join(File.dirname(__FILE__), "..", "app", "controllers"),
    File.join(File.dirname(__FILE__), "..", "app", "models"),
    File.join(File.dirname(__FILE__), "..", "db"),
    File.join(File.dirname(__FILE__), "..", "config")
  ]
end

required_paths.each { |path| $LOAD_PATH << path }
Dir["app/models/*.rb"].each { |model| require model.split("/").last }

class Application < Matrack::Application
end
