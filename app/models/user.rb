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

class User < ApplicationRecord
  devise :two_factor_authenticatable,
         :otp_secret_encryption_key => ENV['TFA_KEY']

  before_create :set_member_id
  attr_encrypted :pin, key: Rails.application.credentials.encrypted_pin_key
  # after_create :send_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable,
         omniauth_providers: %i[github facebook twitter google_oauth2 spotify]
  enum role: [:basic, :admin]

  has_many :bookmarks, class_name: 'News::Bookmark'
  has_many :top_stories, through: :bookmarks, foreign_key: 'top_story_id',
    class_name: 'News::TopStory'
  has_many :dmarc_accounts, class_name: "Emails::DmarcAccount"
  has_many :messages, class_name: "Ahoy::Message", as: :user
  has_many :events, class_name: "Ahoy::Event"
  has_many :visits, class_name: "Ahoy::Visit"
  has_many :document_deliveries, class_name: "Document::Delivery"
  has_many :services, class_name: 'Users::Service'
  has_many :signatures, class_name: 'Signature', foreign_key: 'signed_by'
  has_many :sent_signatures, class_name: 'Signature', foreign_key: 'user_id'
  has_many :access_grants, class_name: "Doorkeeper::AccessGrant",
                           foreign_key: :resource_owner_id,
                           dependent: :delete_all # or :destroy if you need callbacks

  has_many :access_tokens, class_name: "Doorkeeper::AccessToken",
                           foreign_key: :resource_owner_id,
                           dependent: :delete_all # or :destroy if you need callbacks
  has_many :oauth_applications, class_name: 'Doorkeeper::Application', as: :owner

  validates :email, uniqueness: true


  def self.create_with_omniauth(auth)
    find_or_create_by(provider: auth['provider'], uid: auth['uid']) do |user|
      user.email = auth.info.email
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.password = Devise.friendly_token[0,20]
      if auth['info']
         #user.name = auth['info']['name'] || ""
      end
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.omniauth_data"]
        @data = data
        user.email = data["info"]["email"] if user.email.blank?
      end
    end
  end

  def login_token(expires_at = (Time.zone.now + 1.day).to_datetime)
    Tokens::AutoLogin.run!(user: self, expires_at: expires_at)
  end

  def bookmark_story(story)
    if self.top_stories << story
      story
    else
      false
    end
  end

  def enable_two_factor!
    self.otp_secret = User.generate_otp_secret
    self.save
  end

  private

  def send_email
    UsersMailer.new_registration(self).deliver_later!
  end

  def set_member_id
    self.member_id = loop do
      uuid = SecureRandom.uuid
      break uuid unless self.class.exists?(member_id: uuid)
    end
  end
end
