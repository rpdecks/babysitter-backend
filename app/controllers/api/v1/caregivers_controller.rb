class Api::V1::CaregiversController < ApplicationController
    before_action :authenticate_caregiver, only: [:update, :destroy]
    before_action :find_caregiver, only: [:update, :destroy]

  def create
    @caregiver = Caregiver.create(caregiver_params)
    if @caregiver.persisted?
      token = JWT.encode({ caregiver_id: @caregiver.id }, ENV['SUPER_SECRET_KEY'])
      render :json => { token: token }, :status => :ok
    else
      render :json => { msg: @caregiver.errors.full_messages.join(', ') }
    end
  end

  def update
    if @caregiver.update(caregiver_params)
      render :json => @caregiver, :status => :ok
    else
      render :json => { msg: "Caregiver update failed." }, :status => :bad_request
    end
  end

  private

  def caregiver_params
    params.require(:caregiver).permit(:first_name, :last_name, :dob, :gender, :phone, :smoker, :has_pets, :bio, :email, :password, :user_type, :address, :first_aid_cert, :pay_rate, :image, :status)
  end

  def find_caregiver
    @caregiver = Caregiver.find_by(id: params[:id])
  end
end
