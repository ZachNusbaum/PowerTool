class AddSignedByToSignatures < ActiveRecord::Migration[5.2]
  def change
    add_column :signatures, :signed_by, :integer
  end
end
