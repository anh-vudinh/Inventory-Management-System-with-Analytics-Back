class RoleSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :clearance, :is_disabled
  has_one :company
end
