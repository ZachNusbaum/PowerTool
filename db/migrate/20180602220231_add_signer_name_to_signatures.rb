class AddSignerNameToSignatures < ActiveRecord::Migration[5.2]
  def change
    add_column :signatures, :signer_name, :string, default: nil, null: true
    add_column :signatures, :signer_title, :string, default: nil, null: true
  end
end
