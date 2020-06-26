class Api::V1::Caregivers::JobOpportunitiesController < ApplicationController
    before_action :authenticate, only: [:get_info, :update]

    def index
    end

    private

    def job_opp_params
      params.require(:job_opportunity).permit(:name, :email, :password, :user_type, :address)
    end
  
end
