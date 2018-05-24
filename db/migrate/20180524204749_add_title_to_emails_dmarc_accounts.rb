class AddTitleToEmailsDmarcAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :emails_dmarc_accounts, :title, :string
    add_index :emails_dmarc_accounts, :title, unique: true
  end
end
