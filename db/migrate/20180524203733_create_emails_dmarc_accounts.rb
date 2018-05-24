class CreateEmailsDmarcAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :emails_dmarc_accounts do |t|
      t.string :api_key
      t.references :user, foreign_key: true
      t.string :token

      t.timestamps
    end
    add_index :emails_dmarc_accounts, :token, unique: true
    add_index :emails_dmarc_accounts, :api_key, unique: true
  end
end
