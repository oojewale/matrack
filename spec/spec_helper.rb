# $LOAD_PATH.unshift
def paths
  [
    File.expand_path("../../lib", __FILE__),
    File.expand_path("features/feature_helper.rb", __FILE__)
  ]
end
paths.each { |path| $LOAD_PATH << path }

require "simplecov"
SimpleCov.start
require "codeclimate-test-reporter"
require "matrack"
# require "todo/config/application.rb"
require "rspec"

SimpleCov.start do
  formatter SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    CodeClimate::TestReporter::Formatter
  ]
end
ENV["RACK_ENV"] = "test"
