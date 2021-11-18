class Api::ApplicantsController < ApplicationController
    # skip_before_action :confirm_authentication, only: [:index]

    def index
        applicants = Applicant.all
        render json: applicants, status: :ok
    end

end
