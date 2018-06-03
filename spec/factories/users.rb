# == Schema Information
#
# Table name: users
#
#  created_at                :datetime         not null
#  current_sign_in_at        :datetime
#  current_sign_in_ip        :inet
#  email                     :string           default(""), not null
#  encrypted_otp_secret      :string
#  encrypted_otp_secret_iv   :string
#  encrypted_otp_secret_salt :string
#  encrypted_password        :string           default(""), not null
#  encrypted_pin             :string
#  encrypted_pin_iv          :string
#  id                        :bigint(8)        not null, primary key
#  last_sign_in_at           :datetime
#  last_sign_in_ip           :inet
#  member_id                 :string
#  name                      :string
#  otp_backup_codes          :string           is an Array
#  otp_required_for_login    :boolean
#  provider                  :string
#  remember_created_at       :datetime
#  reset_password_sent_at    :datetime
#  reset_password_token      :string
#  role                      :integer          default("basic"), not null
#  send_daily_stories        :boolean          default(FALSE), not null
#  sign_in_count             :integer          default(0), not null
#  uid                       :string
#  updated_at                :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_member_id             (member_id) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryBot.define do
  factory :user do
    
  end
end
