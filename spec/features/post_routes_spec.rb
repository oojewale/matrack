require_relative "feature_helper"

describe "post routes", type: :feature do
  before(:all) do
    User.create(firstname: "Olaide", lastname: "Ojewale", email: "olaide@mail.co", password: "feature_test")
  end
  after(:all) { User.destroy_all }

  let(:email) { User.last.email }
  let(:password) { User.last.password }

  scenario "add new task" do
    visit "/todolist/new"

    fill_in "title", with: "App in test mode"
    fill_in "start", with: "23/12/2015 12:00:00"

    click_on "Add Task"
    expect(page).to have_selector("p", "Task successfully created")
  end

  scenario "add new task" do
    visit "/user/login"

    fill_in "title", with: "App in test mode"
    fill_in "start", with: "23/12/2015 12:00:00"

    click_on "Add Task"
    expect(page).to have_selector("p", "Task successfully created")
  end
end