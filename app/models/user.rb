class User < ApplicationRecord
    has_secure_password
    has_many :employee_users
    has_many :employees, through: :employee_users
    has_many :company_employees, through: :employees
    has_many :companies, through: :company_employees
end
