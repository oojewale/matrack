require_relative "feature_helper"

describe "post routes", type: :feature do
  before(:all) do
    User.create(firstname: "Olaide", lastname: "Ojewale", email: "olaide@mail.co", password: "feature_test")
  end
  after(:all) { User.destroy_all }

  let(:email) { User.last.email }
  let(:password) { "feature_test" }

  scenario "add new task" do
    visit "/todolist/new"

    fill_in "title", with: "App in test mode"
    fill_in "start", with: "23/12/2015 12:00:00"

    click_on "Add Task"
    expect(page).to have_selector("p", "Task successfully created")
  end

  scenario "logs in user and redirects to task page" do
    visit "/"

    fill_in "user_email", with: email
    fill_in "user_password", with: password

    click_on "Login"
    expect(page).to have_content "Saved Tasks"
  end

  scenario "registers user" do
    visit "/"

    fill_in "firstname", with: "angel"
    fill_in "lastname", with: "spirit"
    fill_in "email", with: "holy@tabernacle.com"
    fill_in "password", with: "password_of_the_tabernacle"
    fill_in "confpswd", with: "password_of_the_tabernacle"

    click_on "Register"
    expect(page).to have_content "New Task"
  end
end