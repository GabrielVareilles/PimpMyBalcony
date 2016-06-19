class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.where(user_id: current_user.id)
    end
  end

  def show?
    record.user == user
  end

  def new?
    create?
  end

  def create?
    true  # need to be logged in when creating a cart
  end

  def destroy?
    record.user == user  # Only balcony creator can update it
  end
end
