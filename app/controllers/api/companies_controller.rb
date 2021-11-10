class Api::CompaniesController < ApplicationController
    skip_before_action :confirm_authentication, only: [:index]

    def index
        user_companies = current_user.companies.filter{|company| company.is_parent == true}
        render json: user_companies, status: :ok
    end
end
