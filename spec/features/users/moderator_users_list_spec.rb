require 'rails_helper'
feature 'Moderator can only list some of the Users' do
  context 'while i am a moderator' do
    let!(:user_admin1) { create :user, :admin }
    let!(:user_admin2) { create :user, :admin }
    let!(:user_moderator) { create :user, :moderator }
    let!(:user_courseholder) { create :user, :courseholder }
    scenario 'I can see all users Im allowed to see' do
      user_login_as(user_moderator)
      click_on I18n.t('pages.index.show-users')
      expected_rows 3
    end
  end
end