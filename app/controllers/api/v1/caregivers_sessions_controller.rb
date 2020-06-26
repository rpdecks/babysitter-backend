class Api::V1::CaregiversSessionsController < ApplicationController

  def create
    @caregiver = Caregiver.find_by(email: session_params[:email])

    if @caregiver
      if @caregiver.authenticate(session_params[:password])
        token = JWT.encode({ caregiver_id: @caregiver.id }, ENV['SUPER_SECRET_KEY'])
        render json: { token: token }, status: :ok
      else
        render json: { message: 'Password is incorrect' }, status: :unauthorized
      end
    else
      render json: { message: "That email does not exist" }, status: :not_found
    end
  end
  
  def destroy
  end
    
  private

  def session_params
    params.require(:caregiver).permit(:email,:password)
  end

end 