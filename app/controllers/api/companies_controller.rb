class Api::CompaniesController < ApplicationController

    def index
        user_companies = current_user.companies.filter{|company| company.is_parent == true}
        render json: user_companies, status: :ok
    end

    def get_children
        child_companies = Company.where(parent_id: params[:id])
        render json: child_companies, status: :ok
    end
end
