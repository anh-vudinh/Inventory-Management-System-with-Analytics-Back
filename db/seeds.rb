# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "seeding start"

structures = ["Sole Proprietorship", "Partnership", "S Corporation", "Corporation", "Limited Liability Company"]
organizations = ["For-Profit", "Non-Profit", "Not-For-Profit"]
industries = ["Agriculture, forestry, hunting, and fishing", "Mining", "Utilities", "Construction", "Manufacturing", "Wholesale Trade", "Retail Trade", "Transportaion and Warehousing", "Information", "Data Processing Service", "Finance and Insurance", "Real Estate and Rental Leasing"]

comp1 = Company.create(name: "coa", location: Faker::Address.full_address, description: Faker::Company.catch_phrase, parent_id: 0, is_parent: true, is_active: [true, false].sample, established: Date.today.advance(days: rand(-1000..1000)), structure: structures.sample, organization: organizations.sample, industry: industries.sample, logo: "https://source.unsplash.com/random/800x600")
#applicant = Applicant.find_by(first_name: "Vu")
#employee1 = Employee.create(first_name: applicant.first_name, middle_name: applicant.middle_name, last_name: applicant.last_name, dob: applicant.dob, street_address: applicant.street_address, zipcode: applicant.zipcode, state: applicant.state, city: applicant.city, age: applicant.age, gender: applicant.gender, phone_number: applicant.phone_number, email: applicant.email, emergency_contact_info: Faker::PhoneNumber.cell_phone, emergency_contact_relation: "N/A", emergency_contact_name: Faker::Name.name, citizenship_type: "N/A", is_citizen: applicant.is_citizen, is_veteran: applicant.is_veteran, is_felon: applicant.is_felon, highest_education: applicant.highest_education, start_hire: DateTime.now)
employee1 = Employee.find_by(first_name: "Vu")
# user1 = User.create(username: "vu", password: "vu", is_disabled: false, step_verify: false, verify_type: "email")
CompanyEmployee.create(company_id: comp1.id, employee_id: employee1.id)
# EmployeeUser.create(user_id: user1.id, employee_id: employee1.id)

10.times do
    puts "new company"
    is_parent = [true, false].sample
    if is_parent
        parent_id = 0
    else
        parent_id = rand(1..10)
    end

    comp = Company.new(name: Faker::Company.name, location: Faker::Address.full_address, description: Faker::Company.catch_phrase, parent_id: parent_id, is_parent: is_parent, is_active: [true, false].sample, established: Date.today.advance(days: rand(-1000..1000)), structure: structures.sample, organization: organizations.sample, industry: industries.sample, logo: "https://source.unsplash.com/random/800x600")
    if comp.valid?
        comp.save
        CompanyEmployee.create(company_id: comp.id, employee_id: employee1.id)
        puts "created"
    end
end

# Faker::Config.locale = 'en-US'
# education_array = ["Less Than High School", "High School Diploma or Equivalent", "Some College, No Degree", "Associate’s Degree", "Bachelor’s Degree", "Apprenticeship", "Certification", "License", "Postsecondary Non-Degree Award", "Master’s Degree", "Doctoral or Professional Degree"]

# 1.times do
#     dob = Faker::Date.birthday(min_age: 18, max_age: 85)
#     age = DateTime.now.year-dob.year
#     # first_name = Faker::Name.first_name
#     interviewed = [true,false].sample
#     if interviewed
#         interview_date = Faker::Date.backward(days: 14)
#     else
#         interview_date = nil
#     end
#     #applicant = Applicant.create(first_name: first_name, middle_name: Faker::Name.middle_name, last_name: Faker::Name.last_name, street_address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state, zipcode: Faker::Address.zip_code, extra_info: "extra info blah blab blah blab blop", dob: dob, age: age, gender: Faker::Gender.binary_type, phone_number: Faker::PhoneNumber.cell_phone, email: Faker::Internet.email(name: first_name), is_citizen: [true,false].sample, is_veteran: [true,false].sample, is_felon: [true,false].sample, is_candidate: [true,false].sample, did_interviewed: interviewed, interview_date: interview_date, interview_rating: rand(0..10), highest_education: education_array.sample)
#     applicant = Applicant.create(first_name: "Vu", middle_name: "Thomas", last_name: "Dinh", street_address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state, zipcode: Faker::Address.zip_code, extra_info: "extra info blah blab blah blab blop", dob: dob, age: age, gender: Faker::Gender.binary_type, phone_number: Faker::PhoneNumber.cell_phone, email: Faker::Internet.email(name: "vu"), is_citizen: [true,false].sample, is_veteran: [true,false].sample, is_felon: [true,false].sample, is_candidate: [true,false].sample, did_interviewed: interviewed, interview_date: interview_date, interview_rating: rand(0..10), highest_education: education_array.sample)
    
#     puts applicant.first_name
# end




puts "seeding done"