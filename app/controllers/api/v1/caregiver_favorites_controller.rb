class Api::V1::CaregiverFavoritesController < ApplicationController
    before_action :authenticate_caregiver, only: [:create]
    
    def create
        if current_caregiver
            @caregiver_favorite = CaregiverFavorite.find_by(employer_id: caregiver_favorite_params[:employer_id], caregiver_id: current_caregiver.id)
            if @caregiver_favorite
                deletedId = @caregiver_favorite.id
                if @caregiver_favorite.destroy
                    render :json => { created: false, idToRemove: deletedId }, :status => :ok
                end
            else
                @caregiver_favorite = CaregiverFavorite.new(caregiver_favorite_params)
                @caregiver_favorite.caregiver_id = current_caregiver.id
                if @caregiver_favorite.save
                    render :json => { created: true, favorite: @caregiver_favorite.as_json }, :status => :ok
                end
            end
        else
            render :json => { msg: "Favoriting error" }, :status => :bad_request
        end
    end

    private

    def caregiver_favorite_params
        params.require(:caregiver_favorite).permit(:employer_id, :caregiver_id)
    end
end