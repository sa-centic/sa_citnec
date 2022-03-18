require "rails_helper"

RSpec.feature "Users list", :type => :feature do

  let(:user) { create :user }

  scenario "User visits the index list" do
    user_login_as(user)
    visit users_path
    byebug
    expect(page).to have_text("Users")
  end
end