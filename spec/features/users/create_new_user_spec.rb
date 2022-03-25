require "rails_helper"

RSpec.feature "Create new user" do
  let!(:role_admin) { create(:role, name: :admin) }
  let!(:role_moderator) { create(:role, :moderator) }
  let!(:role_courseholder) { create(:role, name: :courseholder) }
  let!(:role_courstaker) { create(:role, :coursetaker) }

  let(:user_admin) { create(:user, :admin) }
  let(:user_moderator) { create(:user, :moderator) }
  let(:user_courseholder) { create(:user, :courseholder) }
  let(:user_coursetaker) { create(:user, :coursetaker, courseholder_id: user_courseholder.id) }

  scenario "Admin Create new courseholder" do
    user_login_as(user_admin)
    click_on('+')
    choose I18n.t('role.courseholder')
    fill_in I18n.t('activerecord.attributes.user.first_name'), :with => (Faker::Name.first_name)
    fill_in I18n.t('activerecord.attributes.user.last_name'), :with => (Faker::Name.last_name)
    fill_in('E-mail', :with => (Faker::Internet.email))
    find('input[name="commit"]').click

  end

  scenario "Create new admin" do

  end

end