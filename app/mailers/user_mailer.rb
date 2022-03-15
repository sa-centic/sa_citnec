class UserMailer < ApplicationMailer
  default from: 'notifications@saCitnec.com'


  def invite_mail(recipient, token)
    @recipient = recipient
    @token = token
    mail(to: recipient.email, subject: I18n.t('helpers.misc.invite_mail_header'))
  end
end
