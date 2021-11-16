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

end
