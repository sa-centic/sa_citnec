require "rails_helper"

RSpec.feature "Delete course", :type => :feature do

  let(:user) { create :user, :admin }
  let!(:course) { create :course}
  let!(:course1) { create :course}

  scenario "User deletes one course from index list", js: true do
    user_login_as(user)
    visit courses_path
    expected_rows(2)
    page.find(:table_row, [course.course_name.to_str]).click
    debugger
    click_on('Slet')
    visit courses_path
    expected_rows(1)
  end
end