class CreateUsersServices < ActiveRecord::Migration[5.2]
  def change
    create_table :users_services do |t|
      t.string :provider
      t.string :uid
      t.string :access_token
      t.string :access_token_secret
      t.string :refresh_token
      t.datetime :expires_at
      t.jsonb :auth

      t.timestamps
    end
  end
end
