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

comp1 = Company.create(name: "coA", location: "1st seed", description: "test company A", is_parent: true, is_active: true, parent_id: 0, established: Date.today.advance(days: rand(-1000..1000)), structure: structures.sample, organization: organizations.sample, industry: industries.sample)
CompanyEmployee.create(company_id: comp1.id, employee_id: employee1.id)
applicant1 = Applicant.create(first_name: "vu", middle_name: "t", last_name: "dinh", extra_info: "nothing", application_company: comp1.id)
Employee.create(first_name: "vu", middle_name: "t", last_name: "dinh")
employee1 = Employee.find_by(first_name: "vu")
user1 = User.create(username: "vu", password: "vu", is_disabled: false, step_verify: false, verify_type: "email")
EmployeeUser.create(user_id: user1.id, employee_id: employee1.id)

10.times do
comp = Company.create(name: "co#{rand(1..25)}", location: "#{rand(1000..9999)} SomeStreet, Pearland, TX, #{rand(10000..99999)}", description: "test company description", is_parent: [true, false].sample, is_active: [true, false].sample, parent_id: [0..5].sample, established: Date.today.advance(days: rand(-1000..1000)), structure: structures.sample,type: types.sample, industry: industries.sample)
CompanyEmployee.create(company_id: comp.id, employee_id: employee1.id)
end

puts "seeding done"