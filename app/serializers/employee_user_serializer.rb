class EmployeeUserSerializer < ActiveModel::Serializer
  attributes :id
  has_one :employee
  has_one :user
end
