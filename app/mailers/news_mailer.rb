class NewsMailer < ApplicationMailer
  def new_top_stories(recipient)
    @stories = News::TopStory.where('created_at > ?', (Time.zone.now - 1.day))
    @recipient = recipient

    track user: recipient

    mail to: recipient.email,
      subject: 'New Top Stories',
      from: 'news@zdnenterprises.com'
  end
end
