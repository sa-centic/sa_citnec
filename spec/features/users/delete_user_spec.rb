require 'rails_helper'

feature 'users' do
  let!(:role_admin) { create(:role, name: :admin) }
  let!(:role_moderator) { create(:role, :moderator) }
  let!(:role_courseholder) { create(:role, name: :courseholder) }
  let!(:role_courstaker) { create(:role, :coursetaker) }

  let!(:user_admin) { create(:user, :admin) }
  let!(:user_moderator) { create(:user, :moderator) }
  let!(:user_courseholder) { create(:user, :courseholder) }
  let(:user_coursetaker) { create(:user, courseholder_id: user_courseholder.id) }


      scenario 'I can delete any user' do
        user_login_as(user_admin)
        goto_users_list
        first(:button, 'Slet').click
        # click_on 'vis', match: :first
        expected_rows(1)
        end
      end
