require 'rails_helper'

feature 'recover password' do
  let!(:role_admin) { create(:role, name: :admin) }
  let!(:role_moderator) { create(:role, :moderator) }
  let!(:role_courseholder) { create(:role, name: :courseholder) }
  let!(:role_courstaker) { create(:role, :coursetaker) }

  let!(:user) { create(:user, :admin) }
  let!(:user_moderator) { create(:user, :moderator) }
  let!(:user_courseholder) { create(:user, :courseholder) }
  let!(:user_coursetaker) { create(:user, :coursetaker, courseholder_id: user_courseholder.id) }

  scenario 'recover password for existing user who is not an attendant' do
    visit_password_recovery_page

    enter_email_and_click_recover user.email

    expect(recovery_email_sent_to_email(user.email)).to eq true

    click_reset_password_link_in_mail

    fill_out_and_submit_password_form

    expect(page).to have_content(I18n.t('devise.passwords.updated'))

    click_on I18n.t("common.Log out")

    log_in(user.email, 'NewPassword123')

    expect(page.current_path).to eq "/"
  end

  scenario 'Course attendants should not receive any email' do
    visit_password_recovery_page

    enter_email_and_click_recover user_coursetaker.email

    expect(recovery_email_sent_to_email(user_coursetaker.email)).to eq false
  end

  private

  def visit_password_recovery_page
    visit new_user_session_path
    find_link(I18n.t('devise.passwords.recover_password_button')).click
    expect(page.current_path).to eq new_user_password_path
  end

  def enter_email_and_click_recover(email)
    fill_in I18n.t('activerecord.attributes.user.email'), with: email
    click_button I18n.t('users.passwords.new.send_me_reset_password_instructions')
    expect(page).to have_content(I18n.t('devise.passwords.send_instructions'))
  end

  def recovery_email_sent_to_email(email)
    mail = ActionMailer::Base.deliveries.last

    return false if mail.nil?

    mail.subject == I18n.t('devise.mailer.reset_password_instructions.subject') && mail.to.first == email
  end

  def click_reset_password_link_in_mail
    mail = ActionMailer::Base.deliveries.last
    link = URI(/href=\"(?<link>.*)\"/.match(mail.body.decoded)[:link])
    visit "#{link.path}?#{link.query}"
    expect(page).to have_content(I18n.t('common.confirm_new_password'))
  end

  def fill_out_and_submit_password_form
    destroy_user_session_path
    fill_in I18n.t('common.new_password'), with: 'NewPassword123'
    fill_in I18n.t('common.confirm_new_password'), with: 'NewPassword123'
    click_button I18n.t('common.change_my_password')
    sleep 5
  end

  def log_in(email, password)
    fill_in "user_email", with: I18n.t('activerecord.attributes.default.email'), with: email

    fill_in "user_password", with: I18n.t('activerecord.attributes.user.password'), with: password

    click_button I18n.t('users.sessions.new.sign_in')

  end
end