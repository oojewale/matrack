APP_PATH = __dir__
require "./config/application"
MatrackApp = Matrack::Application.new

require "./config/routes"

use Rack::Static, :urls => ["/css", "/images","/js"], :root => "app/assets"
use Rack::MethodOverride
use Rack::Session::Cookie
use Rack::Reloader
run MatrackApp