def paths
  [
    File.expand_path("../../lib", __FILE__),
    File.expand_path("../features/feature_helper", __FILE__),
    File.expand_path("../todo", __FILE__),
    File.expand_path("../matrack", __FILE__)
  ]
end
paths.each { |path| $LOAD_PATH << path }


require "coveralls"
Coveralls.wear!
require "matrack"
require_relative "todo/test_helper.rb"
require "rspec"
