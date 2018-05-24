# == Schema Information
#
# Table name: emails_incoming_messages
#
#  created_at  :datetime         not null
#  envelope    :jsonb
#  from        :string
#  headers     :jsonb
#  html        :text
#  id          :bigint(8)        not null, primary key
#  message_id  :string
#  plain       :text
#  reply_plain :text
#  sent_at     :datetime
#  to          :string
#  token       :string
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_emails_incoming_messages_on_token  (token) UNIQUE
#

FactoryBot.define do
  factory :emails_incoming_message, class: 'Emails::IncomingMessage' do
    token ""
    headers ""
    envelope ""
    plain "MyText"
    html "MyText"
    reply_plain "MyText"
    message_id "MyString"
    to "MyString"
    from "MyString"
    sent_at "2018-05-23 16:47:46"
  end
end
