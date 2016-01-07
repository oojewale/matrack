require_relative "feature_helper"

describe "post routes", type: :feature do
  scenario "add new task" do
    visit "/todolist/new"

    fill_in "title", with: "App in test mode"
    fill_in "start", with: "23/12/2015 12:00:00"

    click_on "Add Task"
    expect(page).to have_selector("p", "Task successfully created")
  end
end