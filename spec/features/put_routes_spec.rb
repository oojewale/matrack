require_relative "feature_helper"

describe "put routes", type: :feature do
  let(:id) { Task.last.task_id }

  scenario "update a task" do
    page.driver.put "/todolist",  { id: id, title: "App in test mode", start: "23/12/2015 12:00:00" }
    expect(page).to have_selector("p", "Task successfully updated")
  end

  scenario "change task status to done" do
    page.driver.put "/todolist",  id: id, done: "yes"
    expect(page).to have_selector("p", "Task successfully updated")
  end
end