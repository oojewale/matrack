require "spec_helper"
require "capybara/rspec"

RSpec.configure do |config|
  config.before(:all){ Capybara.app = MatrackApp }
end
