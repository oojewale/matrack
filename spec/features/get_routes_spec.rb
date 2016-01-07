require_relative "feature_helper"

describe "get routes", type: :feature do
  let(:id) { Task.last.task_id }
  let(:invalid_route) {"/todolist/invalid"}
  scenario "visit home page" do
    visit "/"
    expect(page).to have_title "Index"
  end

  scenario "visit todolist index page" do
    visit "/tasks"
    expect(page).to have_content "Finish Scheduler app"
  end

  scenario "visit page of a specific task" do
    visit "/todolist?id=#{id}"
    expect(page).to have_field("title", with: "Finish Scheduler app")
  end

  scenario "visit page of a specific task" do
    invalid_id = id.to_i + 5
    visit "/todolist?id=#{invalid_id}"
    expect(page).to have_selector("p", text: "Invalid ID specified")
  end

  scenario "visit page for new task" do
    visit "/todolist/new"
    expect(page).to have_selector("h5", text: "New Task")
  end

  scenario "visit page for new task" do
    visit "#{invalid_route}"
    expect(page).to have_content("Since we could not find the page you want to visit")
  end

  scenario "logs out" do
    visit "user/logout"
    expect(page).to have_content "Login"
  end
end
