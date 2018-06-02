# Preview all emails at http://localhost:3000/rails/mailers/signatures
class SignaturesPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/signatures/new_request
  def new_request
    SignaturesMailer.new_request
  end

  # Preview this email at http://localhost:3000/rails/mailers/signatures/completed
  def completed
    SignaturesMailer.completed
  end

end
