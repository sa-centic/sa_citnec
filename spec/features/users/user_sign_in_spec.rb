require "rails_helper"

RSpec.feature "User signs in" do

  let(:user) { create :user, :admin }

  scenario "User successfully signs in" do
    user_login_as(user)

    expect(page).to have_content I18n.t('devise.sessions.signed_in')

  end
  end