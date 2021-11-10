class CompanySerializer < ActiveModel::Serializer
  attributes :name, :location, :description, :is_parent, :company_structure, :company_type, :company_model
  
end
