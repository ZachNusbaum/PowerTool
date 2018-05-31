class CreateSignatures < ActiveRecord::Migration[5.2]
  def change
    create_table :signatures do |t|
      t.uuid :uuid
      t.string :recipient_email
      t.jsonb :raw_data
      t.datetime :signed_at
      t.text :description

      t.timestamps
    end
  end
end
