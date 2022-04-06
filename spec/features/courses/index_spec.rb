require "rails_helper"

RSpec.feature "Users list", :type => :feature do

  let(:user) { create :user, :admin }

  scenario "User visits the course index list" do
    user_login_as(user)
    visit courses_path
    expect(page).to have_text("Kursus")
  end
end