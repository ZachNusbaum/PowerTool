class UsersMailer < ApplicationMailer
  layout false
  def new_registration(user)
    @user = user

    track user: user

    mail to: user.email,
      bcc: 'zach@zdnenterprises.com',
      subject: 'Welcome to ZDNE PowerTools!',
      from: 'ptools@zdnenterprises.com'
  end

  def new_service(service)
    @service = service
    @user = service.user

    mail to: service.user.email,
      subject: 'Welcome to ZDNE PowerTools!',
      from: "#{service.provider}-accounts@zdnenterprises.com"
  end

  def welcome(user)
    @user = user

    track user: user

    mail to: user.email,
      bcc: 'zach@zdnenterprises.com',
      subject: 'Welcome to ZDNE PowerTools!',
      from: 'ptools@zdnenterprises.com'
  end
end
