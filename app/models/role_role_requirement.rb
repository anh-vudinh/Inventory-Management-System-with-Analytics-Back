class RoleRoleRequirement < ApplicationRecord
  belongs_to :role
  belongs_to :role_requirement
end
