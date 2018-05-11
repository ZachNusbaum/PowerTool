class CreateDocumentDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :document_deliveries do |t|
      t.string :token
      t.text :description
      t.datetime :expires_at
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :document_deliveries, :token, unique: true
  end
end
