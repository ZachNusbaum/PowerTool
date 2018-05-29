class AddEncryptedPinToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :encrypted_pin, :string
    add_column :users, :encrypted_pin_iv, :string
  end
end
