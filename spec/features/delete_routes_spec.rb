require_relative "feature_helper"

describe "delete routes", type: :feature do
  let(:id) { Task.last.task_id }
  scenario "delete a task" do
    page.driver.delete "/todolist",  task_id: id
    expect(page).to have_selector("p", "Task successfully deleted")
  end
end