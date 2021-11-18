class Api::EmployeesController < ApplicationController

    def get_employees
        company = Company.find_by(id: params[:id])
        employee_names = company.employees
        render json: employee_names.to_json(only: [:id, :first_name, :middle_name, :last_name]), status: :ok
    end

    def show
        employee = Employee.find_by(id: params[:id])
        render json: employee, status: :ok
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

end
