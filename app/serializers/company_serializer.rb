class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :description, :is_parent, :company_structure, :company_type, :company_model, :employees, :children
  
end
