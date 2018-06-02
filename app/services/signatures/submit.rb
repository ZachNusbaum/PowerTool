
class Signatures::Submit < ActiveInteraction::Base
  string :raw_data
  string :signer_name
  string :signer_title, default: nil
  object :signature
  object :signer, class: User

  validates :signer_name, presence: true
  validates :raw_data, presence: { message: 'Please draw a signature' }

  def execute
    sig = signature.update(
                 raw_data: raw_data,
                 signer_name: signer_name,
                 signer_title: signer_title,
                 signer: signer,
                 signed_at: DateTime.now
    )
    errors.merge!(signature.errors) if signature.errors.any?
    return sig
  end
end