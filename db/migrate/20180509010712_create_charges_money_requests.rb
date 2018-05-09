class CreateChargesMoneyRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :charges_money_requests do |t|
      t.string :token, null: false
      t.integer :amount_cents, null: false, default: 0
      t.boolean :paid, null: false, default: false
      t.references :user, foreign_key: true
      t.text :description
      t.string :stripe_charge_id, null: true

      t.timestamps
    end
    add_index :charges_money_requests, :token, unique: true
    add_index :charges_money_requests, :stripe_charge_id, unique: true
  end
end
