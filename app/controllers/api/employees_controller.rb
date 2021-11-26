class Api::EmployeesController < ApplicationController
    before_action :check_can_edit, only: [:create, :transfer_employee, :duplicate_employee]

    def get_employees
        company = Company.find_by(id: params[:id])
        employee_names = company.employees
        render json: employee_names.to_json(only: [:id, :first_name, :middle_name, :last_name]), status: :ok
    end

    def show
        employee = Employee.find_by(id: params[:id])
        company_employee = CompanyEmployee.find_by(company_id: params[:company_id], employee_id: params[:id])
        render json: {employee: employee, company_employee: company_employee}, status: :ok
    end

    def create
        applicant = Applicant.find_by(id: params[:applicant_id])
        company = Company.find_by(id: params[:company_id])
        existing_employee = Employee.find_by(first_name: applicant.first_name, last_name: applicant.last_name, middle_name: applicant.middle_name)
        if existing_employee
            if company.employees.find_by(first_name: applicant.first_name, last_name: applicant.last_name, middle_name: applicant.middle_name)
                render json: {error: "Employee Already Hired at #{company.name}"}, status: :unprocessable_entity
            else
                CompanyEmployee.create(company_id: company.id, employee_id: existing_employee.id)
                render json: existing_employee, status: :created
            end
        else
            new_employee = Employee.create(first_name: applicant.first_name, middle_name: applicant.middle_name, last_name: applicant.last_name, dob: applicant.dob, street_address: applicant.street_address, zipcode: applicant.zipcode, state: applicant.state, city: applicant.city, age: applicant.age, gender: applicant.gender, phone_number: applicant.phone_number, email: applicant.email, is_citizen: applicant.is_citizen, is_veteran: applicant.is_veteran, is_felon: applicant.is_felon, highest_education: applicant.highest_education, start_hire: DateTime.now)
            CompanyEmployee.create(company_id: company.id, employee_id: new_employee.id)
            render json: new_employee, status: :created
        end
    end

    def transfer_employee
        company_employee = CompanyEmployee.find_by(company_id: params[:from_company], employee_id: params[:transfer_employee])
        possible_duplicate = Company.find_by(id: params[:to_company]).employees.find_by(id: params[:transfer_employee])
        if possible_duplicate
            render json: {error: "Employee Already In That Company"}, status: :unprocessable_entity
        else
            company_employee.update(company_id: params[:to_company])
            render json: company_employee, status: :ok
        end
    end

    def duplicate_employee
        company_employee = CompanyEmployee.find_by(company_id: params[:from_company], employee_id: params[:employee])
        possible_duplicate = Company.find_by(id: params[:to_company]).employees.find_by(id: params[:employee])
        if possible_duplicate
            render json: {error: "Employee Already In That Company"}, status: :unprocessable_entity
        else
            new_company_employee = CompanyEmployee.create(company_id: params[:to_company], employee_id: params[:employee])
            render json: new_company_employee, status: :ok
        end
    end

    private
    def check_can_edit
        if params[:company_id]
            company = Company.find_by(id: params[:company_id])
            if !company.is_active
                cn = company.name
                render json: {error: "Must Remove Lock on (#{cn})"}, status: :unprocessable_entity  
            end
        else
            if params[:to_company]
                to_company = Company.find_by(id: params[:to_company])
                from_company = Company.find_by(id: params[:from_company])
                if !to_company.is_active || !from_company.is_active
                    tcn = to_company.name
                    fcn = from_company.name
                    render json: {error: "Must Remove Lock on either (#{fcn}) or (#{tcn})"}, status: :unprocessable_entity  
                end
            end
        end
    end
end
