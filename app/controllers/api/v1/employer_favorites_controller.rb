class Api::V1::EmployerFavoritesController < ApplicationController
    before_action :authenticate_employer, only: [:create]
    
    def create
        if current_employer
            @employer_favorite = EmployerFavorite.find_by(caregiver_id: employer_favorite_params[:caregiver_id], employer_id: current_employer.id)
            if @employer_favorite
                deletedId = @employer_favorite.id
                if @employer_favorite.destroy
                    render :json => { created: false, idToRemove: deletedId }, :status => :ok
                end
            else
                @employer_favorite = EmployerFavorite.new(employer_favorite_params)
                @employer_favorite.employer_id = current_employer.id
                if @employer_favorite.save
                    render :json => { created: true, favorite: @employer_favorite.as_json }, :status => :ok
                end
            end
        else
            render :json => { msg: "Favoriting error" }, :status => :bad_request
        end
    end

    private

    def employer_favorite_params
        params.require(:employer_favorite).permit(:employer_id, :caregiver_id)
    end
end