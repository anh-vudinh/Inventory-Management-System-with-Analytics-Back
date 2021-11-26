class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :middle_name, :last_name, :dob, :street_address, :zipcode, :state, :city, :age, :gender, :phone_number, :email, :emergency_contact_name, :emergency_contact_relation, :emergency_contact_info, :citizenship_type, :is_citizen, :is_veteran, :is_felon, :employement_status, :highest_education, :start_hire, :end_hire
  # has_many :company_employees
end

