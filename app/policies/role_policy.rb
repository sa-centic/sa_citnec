class RolePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      case user.roles.first.name.to_sym
      when :admin
        scope.all
      when :moderator
        scope.where(name: [:courseholder, :coursetaker])
      when :courseholder
        scope.where(name: :coursetaker)
      end
    end

  end
end

# class TypePolicy < ApplicationPolicy
#   class Scope < Scope
#     def resolve
#       case user.type
#       when :admin
#         scope.all
#       when :moderator
#         scope.where(type: [:courseholder, :coursetaker])
#       when :courseholder
#         scope.where(type: :coursetaker)
#       end
#     end
#
#   end
# end