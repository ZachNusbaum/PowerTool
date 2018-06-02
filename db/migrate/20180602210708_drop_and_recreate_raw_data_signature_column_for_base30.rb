class DropAndRecreateRawDataSignatureColumnForBase30 < ActiveRecord::Migration[5.2]
  def change
    remove_column :signatures, :raw_data, :jsonb
    add_column :signatures, :raw_data, :text, default: nil
  end
end
