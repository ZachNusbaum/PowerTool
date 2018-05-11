class Charges::MoneyRequestMailer < ApplicationMailer
  layout false

  def receipt(request, email)
    @request = request
    attachments['receipt.pdf'] = @request.receipt.render
    mail to: email,
      subject: 'Your ZDN Enterprises Payment (via PowerTools)',
      from: 'payments@zdnenterprises.com'
  end
end
