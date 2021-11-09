class Employee < ApplicationRecord
    has_many :company_employees
    has_many :companies, through: :company_employees
    has_many :employee_users
    has_many :users, through: :employee_users
end
