class Api::UsersController < ApplicationController
    skip_before_action :confirm_authentication, only: [:index]

    def index
        
    end

end
