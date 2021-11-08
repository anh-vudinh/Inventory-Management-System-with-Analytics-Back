class RoleSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :clearance, :is_disabled
  
  has_one :company

  has_many :role_role_materials
  has_many :role_materials, through: :role_role_materials

  has_many :role_role_requirements
  has_many :role_requirements, through: :role_role_requirements

end
