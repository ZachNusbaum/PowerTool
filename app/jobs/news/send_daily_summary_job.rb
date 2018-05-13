class News::SendDailySummaryJob < ApplicationJob
  queue_as :default

  def perform
    User.where(send_daily_stories: true).each do |user|
      NewsMailer.
        new_top_stories(user).
        deliver_later(wait: 1.minute)
    end
  end
end
