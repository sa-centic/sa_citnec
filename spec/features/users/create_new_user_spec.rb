require "rails_helper"

RSpec.feature "Create new user" do
  let!(:role_admin) { create(:role, name: :admin) }
  let!(:role_moderator) { create(:role, :moderator) }
  let!(:role_courseholder) { create(:role, name: :courseholder) }
  let!(:role_courstaker) { create(:role, :coursetaker) }

  let(:user_admin) { create(:user, :admin) }
  let(:user_moderator) { create(:user, :moderator) }
  let(:user_courseholder) { create(:user, :courseholder) }
  let(:user_coursetaker) { create(:user, :coursetaker) }

  scenario "Admin Create new courseholder" do
    user_login_as(user_admin)
    click_on('+')
    expect(page).to have_content ('Sign up for Citnec')
    choose I18n.t('activerecord.roles.coursetaker')
    fill_in('First name', :with => (Faker::Name.first_name))
    fill_in('Last name', :with => (Faker::Name.last_name))
    fill_in('Email', :with => (Faker::Internet.email))

  end

  scenario "Create new admin" do

  end

end