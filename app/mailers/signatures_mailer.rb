class SignaturesMailer < ApplicationMailer
  layout false

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.signatures_mailer.new_request.subject
  #
  def new_request(request, sender_email = nil)
    @request = request

    mail to: recipient_email,
         subject: 'Your signature is requested',
         from: 'signature-mail@zdnenterprises.com',
         reply: 'web@zdnmail.com',
         bcc: sender_email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.signatures_mailer.completed.subject
  #
  def completed
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
