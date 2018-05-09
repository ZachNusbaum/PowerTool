# == Schema Information
#
# Table name: charges_money_requests
#
#  amount_cents     :integer          default(0), not null
#  created_at       :datetime         not null
#  description      :text
#  id               :integer          not null, primary key
#  paid             :boolean          default(FALSE), not null
#  stripe_charge_id :string
#  token            :string           not null
#  updated_at       :datetime         not null
#  user_id          :integer
#
# Indexes
#
#  index_charges_money_requests_on_stripe_charge_id  (stripe_charge_id) UNIQUE
#  index_charges_money_requests_on_token             (token) UNIQUE
#  index_charges_money_requests_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Charges::MoneyRequest < ApplicationRecord
  belongs_to :user
  has_secure_token

  monetize :amount_cents
end
