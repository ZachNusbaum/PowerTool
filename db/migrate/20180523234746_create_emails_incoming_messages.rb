class CreateEmailsIncomingMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :emails_incoming_messages do |t|
      t.string :token
      t.jsonb :headers
      t.jsonb :envelope
      t.text :plain
      t.text :html
      t.text :reply_plain
      t.string :message_id
      t.string :to
      t.string :from
      t.datetime :sent_at

      t.timestamps
    end
    add_index :emails_incoming_messages, :token, unique: true
  end
end
