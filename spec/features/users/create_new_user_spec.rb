require "rails_helper"

RSpec.feature "Create new user" do
  let!(:role) { create(:role, name: :admin) }
  let!(:role2) { create(:role, :moderator) }
  let!(:role3) { create(:role, name: :courseholder) }
  let!(:role4) { create(:role, :coursetaker) }
  let!(:admin) { create(:user, :admin) }
  let!(:moderator) { create(:user, :moderator) }
  let!(:courseholder) { create(:user, :courseholder) }
  let!(:coursetaker) { create(:user, :coursetaker) }

    scenario "Create new courseholder" do
    user_login_as(admin)
    click_on('+')
    expect(page).to have_content ('Sign up for Citnec')
    byebug
    choose('courseholder')
    fill_in('First name', :with => (Faker::Name.first_name))
    fill_in('Last name', :with => (Faker::Name.last_name))
    fill_in('Email', :with => (Faker::Internet.email))

    end

  scenario "Create new admin" do

  end

  end