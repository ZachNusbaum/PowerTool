# == Schema Information
#
# Table name: users
#
#  created_at             :datetime         not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  id                     :integer          not null, primary key
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  member_id              :string
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default("basic"), not null
#  send_daily_stories     :boolean          default(FALSE), not null
#  sign_in_count          :integer          default(0), not null
#  uid                    :string
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_member_id             (member_id) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  before_create :set_member_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[github]
  enum role: [:basic, :admin]

  has_many :messages, class_name: "Ahoy::Message", as: :user
  has_many :events, class_name: "Ahoy::Event"

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      #user.name = auth.info.name   # assuming the user model has a name
      #user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.create_with_omniauth(auth)
    pry
    find_or_create_by(provider: auth['provider'], uid: auth['uid']) do |user|
      user.email = auth.info.email
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         #user.name = auth['info']['name'] || ""
      end
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  private

  def set_member_id
    self.member_id = loop do
      uuid = SecureRandom.uuid
      break uuid unless self.class.exists?(member_id: uuid)
    end
  end
end
