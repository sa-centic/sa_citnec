class UserMailer < ApplicationMailer
  default from: 'sa+citnec@centic.dk'


  def invite_mail(recipient, token)
    @recipient = recipient
    @token = token
    mail(to: recipient.email, subject: I18n.t('helpers.misc.invite_mail_header'))
  end

  def reset_password_email(recipient, token)
    @recipient = recipient
    @token = token
    mail(to: @recipient.email, subject: 'Nulstil kodeord til Citnec Kursuscenters Optællingssystem')
  end


end
