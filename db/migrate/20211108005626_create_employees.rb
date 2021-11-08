class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :dob
      t.string :street_address
      t.string :zipcode
      t.string :state
      t.string :country
      t.string :age
      t.string :gender
      t.string :phone_number
      t.string :email
      t.string :emergency_contact_name
      t.string :emergency_contact_relation
      t.string :emergency_contact_info
      t.string :citizenship_type
      t.boolean :is_citizen
      t.boolean :is_veteran
      t.boolean :is_felon
      t.string :employement_status
      t.string :highest_education
      t.datetime :start_hire
      t.datetime :end_hire

      t.timestamps
    end
  end
end
