class Api::V1::CaregiversController < ApplicationController
    before_action :authenticate_caregiver, only: [:get_info]

    def create
        @caregiver = Caregiver.create(caregiver_params)
        token = JWT.encode({ caregiver_id: @caregiver.id }, ENV['SUPER_SECRET_KEY'])
        render :json => { token: token }, :status => :ok
    end

    def get_info
      if current_caregiver
        render json: current_caregiver, status: :ok
      else
        render :json => { msg: "User not found" }, :status => :bad_request
      end
    end

    private

    def caregiver_params
      params.require(:caregiver).permit(:first_name, :last_name, :dob, :gender, :phone, :smoker, :has_pets, :bio, :email, :password, :user_type, :address, :first_aid_cert, :pay_rate)
    end
  
    def find_caregiver
      @caregiver = Caregiver.find_by(id: params[:id])
    end
end
