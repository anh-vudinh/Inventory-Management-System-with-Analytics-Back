class CompanyEmployeeSerializer < ActiveModel::Serializer
  attributes :id
  has_one :company
  has_one :employee
end
