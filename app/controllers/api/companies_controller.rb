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
        if parent_company
            parent_company_id = parent_company.id
        else
            parent_company_id = 0
        end
        formatted_address = "#{params[:street] == ""? "" : "#{params[:street]}"} #{params[:city] == ""? "" : ", #{params[:city]}"} #{params[:state] == ""? "" : ", #{params[:state]}"} #{params[:street] == ""? "" : ", #{params[:street]}"}"
        new_company = Company.create(company_params.merge(location: formatted_address, parent_id: parent_company_id))
        if new_company.valid?
            user_employee_id = current_user.employees.first.id
            CompanyEmployee.create(company_id: new_company.id, employee_id: user_employee_id)
            #EmployeeUser.create(employee_id: user_employee_id, user_id: current_user.id)
            render json: new_company, status: :created
        else
            render json: {error: new_company.errors.full_messages}, status: :unprocessable_entity 
        end
    end

    def update
        company = Company.find_by(id: params[:id])
        update_company = company.update(is_active: params[:is_active])
        if update_company
            render json: update_company, status: :ok
        else
            render json: {error: "Failed to Update"}, status: :unprocessable_entity
        end
    end

    private

    def company_params
        params.permit(:name, :location, :parent_id, :established, :is_parent, :is_active, :structure, :organization, :industry, :logo, :description)
    end
end
