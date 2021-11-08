class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :description, :is_parent, :parent_id, :company_structure, :company_type, :company_model
  
end
