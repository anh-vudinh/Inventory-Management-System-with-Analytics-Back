class Role < ApplicationRecord
    has_many :role_role_resources
    has_many :role_resources, through: :role_role_resources
  
    has_many :role_role_requirements
    has_many :role_requirements, through: :role_role_requirements

end
