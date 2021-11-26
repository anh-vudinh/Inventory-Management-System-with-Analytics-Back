class CompanyEmployeeSerializer < ActiveModel::Serializer
  attributes :id, :created_at
  # has_one :company
  # has_one :employee
end
