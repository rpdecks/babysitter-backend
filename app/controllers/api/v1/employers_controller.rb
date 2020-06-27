class Api::V1::EmployersController < ApplicationController
    before_action :authenticate_employer, only: [:get_info]

    def create
        @employer = Employer.create(employer_params)
        token = JWT.encode({ employer_id: @employer.id }, ENV['SUPER_SECRET_KEY'])
        render :json => { token: token }, :status => :ok
    end

    def get_info
      if current_employer
        render json: current_employer, status: :ok
      else
        render :json => { msg: "User not found" }, :status => :bad_request
      end
    end

    private

    def employer_params
      params.require(:employer).permit(:name, :email, :password, :user_type, :address)
    end
  
    def find_employer
      @employer = Employer.find_by(id: params[:id])
    end
end
