class AddRecipientEmailToDocumentDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_column :document_deliveries, :recipient_email, :string
  end
end
