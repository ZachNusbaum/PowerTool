class AddUserIdToSignatures < ActiveRecord::Migration[5.2]
  def change
    add_reference :signatures, :user, foreign_key: true
  end
end
