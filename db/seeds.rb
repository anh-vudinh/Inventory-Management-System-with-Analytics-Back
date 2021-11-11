# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# comp1 = Company.create(name: "companyA", location: "address", description: "test company A", is_parent: true, parent_id: 0, company_structure: "Sole-Proprietorship", company_type: "Non-profit", company_model: "Service")
# applicant1 = Applicant.create(first_name: "vu", middle_name: "t", last_name: "dinh", extra_info: "nothing", application_company: comp1.id)
# employee1 = Employee.create(first_name: "vu", middle_name: "t", last_name: "dinh")
# CompanyEmployee.create(company_id: comp1.id, employee_id: employee1.id)
# user1 = User.create(username: "vu", password: "vu", is_disabled: false, step_verify: false, verify_type: "email")
# EmployeeUser.create(user_id: user1.id, employee_id: employee1.id)

comp1 = Company.create(name: "123companyC", location: "9003 SomeStreet, Pearland, TX, 77777", description: "test company description", is_parent: false, parent_id: 1, company_structure: "Corporation", company_type: "Non-profit", company_model: "Manufacture")
employee1 = Employee.find_by(first_name: "vu")
CompanyEmployee.create(company_id: comp1.id, employee_id: employee1.id)

puts "seeding done"