require "rack"
require "rack/handler/puma"
require "thor"
require "matrack/version"
Dir["../generators/*.rb"].each { |gen_file| require gen_file }
# require_relative File.join(__dir__, "..", "generators", "generator")
# require_relative File.join(__dir__, "..", "generators", "mvc_gen")
# require_relative File.join(__dir__, "..", "generators", "generator_base")
require "matrack/utility"
require "matrack/dependencies"
require "orm/data_utility"
require "orm/data_manager"
require "orm/fetch_queries"
require "orm/queries"
require "orm/base_model"
require "matrack/helper_tags"
require "matrack/session"
require "matrack/base_controller"
require "matrack/route"
require "matrack/router"
