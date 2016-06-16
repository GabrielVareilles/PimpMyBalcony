class BalconyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def show_public?
    true  # Anyone can view a public_balcony
  end

  def show_private?
    record.user == user  # Only user can access the private show
  end

  def create?
    true  # Anyone can create a balcony
  end

  def complete?
    record.user == user
  end

  def update?
    record.user == user  # Only balcony creator can update it
  end

  def destroy?
     record.user == user  # Only balcony creator can update it
  end

  def add_item?
     record.user == user  # Only balcony creator can update it
  end

  def remove_item?
     record.user == user  # Only balcony creator can update it
  end
end
