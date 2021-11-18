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
                            if params[:remember]
                                session[:user_id] = user.id
                                session[:expire_after] = Time.current + 24.hours
                            else
                                session[:user_id] = user.id
                            end
                            render json: user, only: [:username], status: :ok
                        else
                            render json: { error: "Wrong Password" }, status: :unauthorized
                        end
                    else
                        render json: { error: "No User (#{params[:username]}) at #{params[:company]}" }, status: :unprocessable_entity
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
        # session = session[:user_id]
        # if session[:expire_after] < Time.current
        #     render json: {error: "Session Expired"}, status: :unauthorized
        # else
        #     render json: current_user, status: :ok
        # end
    end

    def destroy
        session.delete :user_id
        head :no_content
    end
end
