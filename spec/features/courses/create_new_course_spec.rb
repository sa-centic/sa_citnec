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

  scenario "Admin Create new course" do
    user_login_as(user_admin)
    visit courses_path
    click_on('+')
    fill_in I18n.t('activerecord.attributes.course.course_name'), :with => (Faker::Hobby.activity)
    fill_in I18n.t('activerecord.attributes.course.course_description'), :with => (Faker::Lorem.paragraph)
    fill_in I18n.t('activerecord.attributes.course.max_coursetakers'), :with => (Faker::Number.between(from: 1, to: 20))
    find('input[name="commit"]').click

  end


end