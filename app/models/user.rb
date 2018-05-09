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
  after_create :send_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[github]
  enum role: [:basic, :admin]

  has_many :messages, class_name: "Ahoy::Message", as: :user
  has_many :events, class_name: "Ahoy::Event"
  has_many :visits, class_name: "Ahoy::Visit"

  validates :email, uniqueness: true


  def self.create_with_omniauth(auth)
    @user = find_or_initialize_by(provider: auth['provider'], uid: auth['uid']) do |user|
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
