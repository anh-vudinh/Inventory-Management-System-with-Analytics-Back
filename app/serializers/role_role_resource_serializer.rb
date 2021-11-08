class RoleRoleResourceSerializer < ActiveModel::Serializer
  attributes :id
  has_one :role
  has_one :resource
end
