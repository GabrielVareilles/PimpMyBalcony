class CartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.where(user_id: current_user.id)
    end
  end

  def add_item?
    true
  end

  def remove_item?
    true
  end

  def clear_cart?
    true
  end

  def destroy?
    record.user == user  # Only balcony creator can update it
  end
end
