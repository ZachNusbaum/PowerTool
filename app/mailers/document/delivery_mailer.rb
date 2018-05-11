class Document::DeliveryMailer < ApplicationMailer
  layout false

  def notification(delivery)
    @delivery = delivery
    @user = delivery.user

    track user: @user

    mail to: @delivery.recipient_email,
      from: 'deliveries@zdnenterprises.com',
      subject: 'You have a new file!'
  end
end
