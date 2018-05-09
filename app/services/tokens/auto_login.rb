class Tokens::AutoLogin < ActiveInteraction::Base
  object :user
  date_time :expires_at, default: (Time.zone.now + 1.day).to_datetime

  def execute
    payload = {
      exp: expires_at.to_i,
      usr: user.member_id
    }

    Jwt::Encode.new(payload).result
  end
end