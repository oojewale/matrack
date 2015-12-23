require_relative "feature_helper"

describe "get routes", type: :feature do
  scenario "visit" do
    visit "/"
    expect(page).to have_title "Index"
  end
end
