require_relative "feature_helper"

describe "get routes", type: :feature do
  scenario "visit home page" do
    visit "/"
    expect(page).to have_title "Index"
  end

  scenario "visit page of a specific task" do
    visit "/todolist?id=1"
    expect(page).to have_field("title", with: "Finish Scheduler app")
  end

  scenario "visit page for new task" do
    visit "/todolist/new"
    expect(page).to have_selector("h5", text: "New Task")
  end
end
