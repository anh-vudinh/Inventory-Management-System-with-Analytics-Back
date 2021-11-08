class Company < ApplicationRecord
    has_many :company_roles
    has_many :roles, through: :company_roles

    has_many :company_employees
    has_many :employees, through: :company_employees
    has_many :employee_users, through: :employees
    has_many :users, through: :employee_users
end
