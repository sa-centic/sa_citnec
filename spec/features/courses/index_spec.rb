require "rails_helper"

RSpec.feature "Courses list", :type => :feature do

  let(:user) { create :user, :admin }
  let(:course) { create :course}

  scenario "User visits the course index list" do
    user_login_as(user)
    visit courses_path
    expect(page).to have_text("Kursus")
    expect(page).to have_attributes(course.course_name, course.course_description, course.max_coursetakers)
  end
end