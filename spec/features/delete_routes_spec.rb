require_relative "feature_helper"

describe "delete routes", type: :feature do
  let(:id) { Task.last.task_id }
  scenario "delete a task" do

    visit "/todolist?id=#{id}"

    page.all("input[type='submit']")[-1].click
    expect(page).to have_selector("p", "Task successfully deleted")
  end
end