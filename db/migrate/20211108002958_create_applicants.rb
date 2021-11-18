class CreateApplicants < ActiveRecord::Migration[6.1]
  def change
    create_table :applicants do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :extra_info
      t.date :dob
      t.string :street_address
      t.string :zipcode
      t.string :state
      t.string :city
      t.string :age
      t.string :gender
      t.string :phone_number
      t.string :email
      t.string :citizenship_type
      t.boolean :is_citizen
      t.boolean :is_veteran
      t.boolean :is_felon
      t.boolean :is_candidate
      t.boolean :did_interviewed
      t.datetime :interview_date
      t.integer :interview_rating
      t.string :last_employer
      t.string :employement_status
      t.string :highest_education
      t.string :application_method
      t.integer :application_company
      t.integer :apply_counter

      t.timestamps
    end
  end
end
