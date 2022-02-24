class FieldPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
     def resolve
       scope.all
     end
  end

  def create?
    @user.role == "owner"
  end

  def update?
    @user.role == "owner"
  end

end
