APP_PATH = __dir__
require "config/application"
MatrackApp = Matrack::Application.new

require "config/routes"
require "config/active_manager"
