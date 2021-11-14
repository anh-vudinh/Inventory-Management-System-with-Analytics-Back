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
        parent_company_id = Company.find_by(name: params[:parent_name]) || 0
        formatted_address = "#{params[:street]}, #{params[:city]}, #{params[:state]}, #{params[:zipcode]}"
        new_company = Company.create(company_params.merge(location: formatted_address, parent_id: parent_company_id))
        if new_company.valid?
            user_employee_id = current_user.employees.first.id
            CompanyEmployee.create(company_id: new_company.id, employee_id: user_employee_id)
            EmployeeUser.create(employee_id: user_employee_id, user_id: current_user.id)
            render json: new_company, status: :created
        else
            render json: {error: new_company.errors.full_messages}, status: :unprocessable_entity 
        end
    end

    private

    def company_params
        params.permit(:name, :location, :parent_id, :established, :is_parent, :is_active, :structure, :organization, :industry, :logo, :description)
    end
end
