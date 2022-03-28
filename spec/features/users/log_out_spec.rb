require 'rails_helper'

feature 'Logout' do
  context 'given session' do
    let!(:user_admin) { create :user, :admin }
    scenario 'can logout' do
      user_login_as(user_admin)
      expect(page).to have_button I18n.t("common.Log out")
      click_on I18n.t("common.Log out")
      expect(page).to have_content I18n.t('users.sessions.new.sign_in')
    end
  end
end