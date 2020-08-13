class Api::V1::EmployersController < ApplicationController
    before_action :authenticate_employer, only: [:update, :destroy]
    before_action :find_employer, only: [:update, :destroy]

  def create
    @employer = Employer.create(employer_params)
    if @employer.persisted?
      token = JWT.encode({ employer_id: @employer.id }, ENV['SUPER_SECRET_KEY'])
      render :json => { token: token }, :status => :ok
    else
      render :json => { msg: @employer.errors.full_messages.join(', ')}
    end
  end

  def update
    if @employer.update(employer_params)
      render :json => @employer, :status => :ok
    else
      render :json => { msg: "Employer update failed." }, :status => :bad_request
    end
  end

  private

  def employer_params
    params.require(:employer).permit(:first_name, :last_name, :dob, :gender, :phone, :smoker, :has_pets, :bio, :email, :password, :user_type, :address, :email, :image, :status)
  end

  def find_employer
    @employer = Employer.find_by(id: params[:id])
    if !@employer
      render :json => { msg: "Could not find employer" }, :status => :bad_request
    else
        return @employer
    end
  end
end
