require 'rails_helper'

feature 'Admin can edit any user' do
  context 'given I am an admin' do
    let!(:user_admin) { create(:user, :admin) }
    let!(:user_moderator) { create(:user, :moderator) }
    let!(:user_courseholder) { create(:user, :courseholder) }
    let(:user_coursetaker) { create(:user, :coursetaker, courseholder_id: user_courseholder.id) }

    scenario 'admin can edit any user' do
      user_login_as(user_admin)
      goto_users_list
      first(:link_or_button , 'Rediger').click
      submit_form_with_changed_values
      expect(page).to have_content I18n.t('common.updated')
    end
  end
end

def submit_form_with_changed_values
  fill_in "user_first_name", with: 'Edited first_name'
  fill_in "user_last_name", with: 'Edited last_name'
  click_on ('Opdater Bruger')
end