class Company < ApplicationRecord
    has_many :company_roles
    has_many :roles, through: :company_roles

    has_many :company_employees
    has_many :employees, through: :company_employees
    has_many :employee_users, through: :employees
    has_many :users, through: :employee_users

    attribute :employees_count
    attribute :children_count

    validates :name, uniqueness: true, presence: true
    validates :structure, inclusion: {in: ["Sole Proprietorship", "Partnership", "S Corporation", "Corporation", "Limited Liability Company"]}
    validates :organization, inclusion: {in: ["For-Profit", "Non-Profit", "Not-For-Profit"]}
    # validates :industry, inclusion: {in: []}

    def employees_count
        self.company_employees.length
    end

    def children_count
        Company.all.where(parent_id: self.id).length
    end
end
