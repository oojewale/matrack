require "spec_helper"
require "capybara/rspec"

RSpec.configure do |config|
  config.before(:all) do
    Capybara.app = MatrackApp
    task = Task.new
    task.title = "Finish Scheduler app"
    task.start = "23/12/2015 12:00:00"
    task.save
  end
  config.after(:all){ Task.destroy_all }
end
