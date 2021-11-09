class Api::SessionsController < ApplicationController
    skip_before_action :confirm_authentication, only: [:show, :login]

    def login
        user = User.find_by_username(params[:username])
        if user&.authenticate(params[:password])
          session[:user_id] = user.id
          render json: user, status: :ok
        else
          render json: { error: 'Wrong Password' }, status: :unauthorized
        end
    end
end
