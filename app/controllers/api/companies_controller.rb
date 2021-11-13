class Api::CompaniesController < ApplicationController

    def index
        user_companies = current_user.companies
        render json: user_companies, status: :ok
    end

    def get_parents
        user_parent_companies = current_user.companies.where(is_parent: true)
        render json: user_parent_companies, status: :ok
    end

    def get_children
        child_companies = Company.where(parent_id: params[:id])
        render json: child_companies, status: :ok
    end

    def create
        parent_company = Company.find_by(name: params[:parent_name])
        new_company = Company.create(company_params, parent_id: parent_company.id)
        if new_company
            user_employee_id = current_user.employees.first.id
            CompanyEmployee.create(company_id: new_company.id, employee_id: user_employee_id)
            EmployeeUser.create(employee_id: user_employee_id, user_id: current_user.id)
            render json: new_company, status: :created
        else
            render json: {error: "Failed to create company: #{params: name}"}, status: :unprocessable_entity 
        end
    end

    private

    def company_params
        params.permit(:name, :street, :city, :state, :zipcode, :established, :is_parent, :company_structure, :company_type, :company_model, :logo, :description)
    end
end
