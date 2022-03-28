require 'rails_helper'

feature 'New User' do
  context 'given I am a new invited user' do
    let!(:user) { create :user, :moderator }
    scenario 'As a New user I can create set my password' do
      send_invitation_email
      follow_link_in_mail
      creating_new_password
      to_welcome_page
    end
  end
end
def send_invitation_email
  token = user.send('set_reset_password_token')
  UserMailer.invite_mail( user, token).deliver
end

def follow_link_in_mail
  mail = ActionMailer::Base.deliveries.last
  expect(mail).to have_link('Opret kodeord')
  # expect(mail).to have_link href: edit_user_password_path
  # expect(mail.body.to_s).to have_content 'Opret kodeord'

  link = URI(/href="(?<link>.*)"/.match(mail.body.decoded)[:link])
  visit "#{link.path}?#{link.query}"
end

def creating_new_password
  fill_in :user_password, with: '1234FemSeks'
  fill_in :user_password_confirmation, with: '1234FemSeks'
  click_on 'Skift min kode'
end

def to_welcome_page
  expect(page).to have_content 'logget ind'
end