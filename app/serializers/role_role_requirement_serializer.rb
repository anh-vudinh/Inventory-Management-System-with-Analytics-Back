class RoleRoleRequirementSerializer < ActiveModel::Serializer
  attributes :id
  has_one :role
  has_one :requirement
end
