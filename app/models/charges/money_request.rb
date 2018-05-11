# == Schema Information
#
# Table name: charges_money_requests
#
#  amount_cents     :integer          default(0), not null
#  created_at       :datetime         not null
#  description      :text
#  id               :bigint(8)        not null, primary key
#  paid             :boolean          default(FALSE), not null
#  stripe_charge_id :string
#  token            :string           not null
#  updated_at       :datetime         not null
#  user_id          :bigint(8)
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

  def receipt
    Receipts::Receipt.new(
      id: token,
      product: 'MoneyRequest',
      company: {
        name: 'ZDN Enterprises - PowerTools',
        address: 'San Diego, California',
        email: 'receipts@zdnenterprises.com'
      },
      line_items: [
        ["Date", created_at.to_s],
        ["Description", description],
        ["Charge ID", stripe_charge_id],
        ["Amount", amount.format]
      ]
    )
  end
end
