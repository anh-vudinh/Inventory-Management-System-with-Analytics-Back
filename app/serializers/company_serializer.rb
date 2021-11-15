class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :established, :is_parent, :is_active, :structure, :organization, :industry, :logo, :description, :employees_count, :children_count
  
end
