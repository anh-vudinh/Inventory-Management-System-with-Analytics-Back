class Api::SessionsController < ApplicationController
    skip_before_action :confirm_authentication, only: [:login, :auto_login]

    def login
        company = Company.find_by(name: params[:company])
        if company
            user = User.find_by(username: params[:username])
            if user
                if user.is_disabled == false
                    company_user = company.users.find_by(id: user.id)
                    if company_user && company_user.username == params[:username]
                        if user.authenticate(params[:password])
                            session[:user_id] = user.id
                            render json: user, only: [:username], status: :ok
                        else
                            render json: { error: "Wrong Password" }, status: :unauthorized
                        end
                    else
                        render json: { error: "No User, #{params[:username]} at #{params[:company]}" }, status: :unprocessable_entity
                    end
                else
                    render json: { error: "Account Disabled" }, status: :unauthorized
                end
            else
                render json: { error: "User Doesn't Exist" }, status: :unprocessable_entity
            end
        else
            render json: { error: "Company Doesn't Exist" }, status: :unprocessable_entity
        end
    end

    def auto_login
        render json: current_user, status: :ok
    end
end
