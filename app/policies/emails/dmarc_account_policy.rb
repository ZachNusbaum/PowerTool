class Emails::DmarcAccountPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user_is_resource_owner_or_admin?
  end

  def new?
    create?
  end

  def create?
    true
  end

  def user_is_resource_owner_or_admin?
    (record.user == user) || user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
