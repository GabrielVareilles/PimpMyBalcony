class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show
    true # anyone can see an item
  end

  def add_plant?
     true  # Only balcony creator can update it
  end

  def remove_plant?
     true  # Only balcony creator can update it
  end

  def duplicate?
    true
  end

  def destroy?
    true
  end

end
