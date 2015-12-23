require_relative "feature_helper"

describe "put routes", type: :feature do
  let(:id) { Task.last.task_id }
  # let(:id) { Task.last.task_id }
  scenario "update a task" do

    visit "/todolist?id=#{id}"

    fill_in "title", with: "App in test mode"
    fill_in "start", with: "23/12/2015 12:00:00"

    click_on "Update"
    expect(page).to have_selector("p", "Task successfully updated")
  end
end