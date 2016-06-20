class CartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.where(user_id: current_user.id)
    end
  end

  def add_item?
    record.user == user
  end

  def remove_item?
    record.user == user
  end

  def destroy?
    record.user == user  # Only balcony creator can update it
  end
end
