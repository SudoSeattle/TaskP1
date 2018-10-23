require "rails_helper"

RSpec.feature "user management", :type => :feature do
  scenario "End User creates a new user" do
    visit "/users/new"

    fill_in "user_name", :with => "test_name"
    fill_in "user_email", :with => "test@example.com"
    click_button "Create User"

    expect(page).to have_text("User was successfully created.")
  end
end
