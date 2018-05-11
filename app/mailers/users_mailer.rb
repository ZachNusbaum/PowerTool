class UsersMailer < ApplicationMailer
  def new_registration(user)
    @user = user

    track user: user

    mail to: user.email,
      bcc: 'zach@zdnenterprises.com',
      subject: 'Welcome to ZDNE PowerTools!',
      from: 'ptools@zdnenterprises.com'
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
