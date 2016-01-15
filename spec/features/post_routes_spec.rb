require_relative "feature_helper"

describe "post routes", type: :feature do
  before(:all) do
    User.create(firstname: "Olaide", lastname: "Ojewale",
                email: "olaide@mail.co", password: "feature_test")
  end
  after(:all) { User.destroy_all }

  let(:email) { User.last.email }
  let(:password) { "feature_test" }
  let(:firstname) { "spirit" }
  let(:lastname) { "angel" }
  let(:new_mail) { "holy@tabernacle.com" }
  let(:new_password) { "password_of_the_tabernacle" }
  let(:conf) { "password_of_the_tabernacle" }

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

  scenario "fails to log in user" do
    visit "/"

    fill_in "user_email", with: new_mail
    fill_in "user_password", with: password

    click_on "Login"
    expect(page).to have_content "Invalid credentials"
  end

  scenario "registers user" do
    visit "/"

    fill_in "firstname", with: firstname
    fill_in "lastname", with: lastname
    fill_in "email", with: new_mail
    fill_in "password", with: new_password
    fill_in "confpswd", with: conf

    click_on "Register"
    expect(page).to have_content "New Task"
  end

  scenario "fails to registers user" do
    conf = "inconsistent_password"
    visit "/"

    fill_in "firstname", with: firstname
    fill_in "lastname", with: lastname
    fill_in "email", with: new_mail
    fill_in "password", with: new_password
    fill_in "confpswd", with: conf

    click_on "Register"
    expect(page).to have_content "Password mismatch"
  end
end
