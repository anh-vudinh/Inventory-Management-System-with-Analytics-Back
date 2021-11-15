class Api::EmployeesController < ApplicationController

    def get_employees
        company = Company.find_by(id: params[:id])
        employee_names = company.employees
        render json: employee_names, include: [:first_name, :middle_name, :last_name], status: :ok
    end

end
