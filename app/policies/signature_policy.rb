class SignaturePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    if User.exists?(email: record.recipient_email)
      existing = User.find_by_email(record.recipient_email)
      record.user == user || user == existing || user.admin? || user == record.signer
    else
      record.user == user || record.signer.nil? || user.admin? || record.signer == user
    end
  end

  def create?
    true
  end

  def submit?
    record.signed_at.nil?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
