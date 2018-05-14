class News::BookmarkPolicy < ApplicationPolicy
  def index?
    true
  end

  def destroy?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
