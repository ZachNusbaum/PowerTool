class Emails::ParseIncomingMessage < ActiveInteraction::Base
  object :params, class: Hash

  def execute
    message = Emails::IncomingMessage.new(
      headers: params["headers"],
      envelope: params["envelope"],
      plain: params["plain"],
      html: params["html"],
      reply_plain: params["reply_plain"],
      to: params["envelope"]["to"],
      from: params["envelope"]["from"],
      message_id: params["headers"]["Message-ID"]
    )
    errors.add(:params, 'are invalid') unless message.save!
  end
end
