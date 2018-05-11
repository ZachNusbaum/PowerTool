FactoryBot.define do
  factory :file_delivery, class: 'File::Delivery' do
    token ""
    recipient_email "MyString"
    description "MyText"
    expires_at "2018-05-11 14:23:05"
    user nil
  end
end
