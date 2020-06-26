class Api::V1::Employers::EmployersController < ApplicationController
    before_action :authenticate, only: [:get_info, :update]

    def create
        @employer = Employer.create(employer_params)
        token = JWT.encode({ employer_id: @employer.id }, ENV['SUPER_SECRET_KEY'])
        render :json => { token: token }, :status => :ok
    end
    private

    def employer_params
      params.require(:user).permit(:name, :email, :password, :user_type, :address)
    end
  
    def find_employer
      @employer = Employer.find_by(id: params[:id])
    end
end
