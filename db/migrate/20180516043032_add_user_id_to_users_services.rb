class AddUserIdToUsersServices < ActiveRecord::Migration[5.2]
  def change
    add_reference :users_services, :user, foreign_key: true
  end
end
