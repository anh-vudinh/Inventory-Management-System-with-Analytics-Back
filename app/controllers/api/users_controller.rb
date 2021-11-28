class Api::UsersController < ApplicationController
    #skip_before_action :confirm_authentication, only: [:index]

    def show
        user = Employee.find_by(id: params[:id]).users.first
        if user
            render json: user, status: :ok
        else
            render json: {error: "No User Account Found"}, status: :not_found
        end
    end

    def create
        new_user = User.new(username: params[:username], password: params[:password], is_disabled: false, step_verify: false)
        if new_user.valid?
            new_user.save
            EmployeeUser.create(employee_id: params[:employee_id], user_id: new_user.id)
            render json: new_user, status: :created
        else
            render json: {error: new_user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        user = User.find_by(id: params[:id])
        if user
            user.update(user_params)
            updated_user = User.find_by(id: params[:id])
            render json: updated_user, status: :ok
        else
            render json: {error: "Create a user first"}
        end
    end

    private
    def user_params
        params.permit(:username, :password, :is_disabled, :step_verify, :verify_type)
    end
end
