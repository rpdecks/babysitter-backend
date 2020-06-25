class Api::V1::EmployersSessionsController < ApplicationController

  def create
    @employer = Employer.find_by(email: session_params[:email])

    if @employer
      if @employer.authenticate(session_params[:password])
        token = JWT.encode({ employer_id: @employer.id }, ENV['SUPER_SECRET_KEY'])
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
    params.require(:employer).permit(:email,:password)
  end

end 