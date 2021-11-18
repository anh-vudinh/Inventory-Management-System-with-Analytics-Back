class ApplicantSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :middle_name, :last_name, :extra_info, :dob, :street_address, :zipcode, :state, :city, :age, :gender, :phone_number, :email, :citizenship_type, :is_citizen, :is_veteran, :is_felon, :is_candidate, :last_employer, :employement_status, :highest_education, :application_method, :application_company, :apply_counter, :did_interviewed, :interview_date, :interview_rating, :created_at
end
