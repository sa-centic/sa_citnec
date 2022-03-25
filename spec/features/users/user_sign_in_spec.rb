require "rails_helper"

RSpec.feature "User signs in" do
  let!(:role_admin) { create(:role, name: :admin) }
  let!(:role_moderator) { create(:role, :moderator) }
  let!(:role_courseholder) { create(:role, name: :courseholder) }
  let!(:role_courstaker) { create(:role, :coursetaker) }

  let!(:user_admin) { create(:user, :admin) }
  let!(:user_moderator) { create(:user, :moderator) }
  let!(:user_courseholder) { create(:user, :courseholder) }
  let!(:user_coursetaker) { create(:user, :coursetaker) }


  scenario "Admin successfully signs in" do
    user_login_as(user_admin)
    expect(page).to have_content I18n.t('devise.sessions.signed_in')

  end

 scenario "Moderator successfully signs in" do
    user_login_as(user_moderator)
    expect(page).to have_content I18n.t('devise.sessions.signed_in')

 end

 scenario "Courseholder successfully signs in" do
    user_login_as(user_courseholder)
    expect(page).to have_content I18n.t('devise.sessions.signed_in')

 end

 scenario "Coursetaker CANNOT successfully signs in" do
    user_login_as(user_coursetaker)
    expect(page).to have_content I18n.t('devise.registrations.signed_up_but_inactive')

  end


end