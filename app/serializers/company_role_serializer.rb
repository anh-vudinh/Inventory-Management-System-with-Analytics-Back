class CompanyRoleSerializer < ActiveModel::Serializer
  attributes :id
  has_one :company
  has_one :role
end
