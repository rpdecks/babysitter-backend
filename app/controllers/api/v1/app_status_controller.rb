class Api::V1::AppStatusController < ApplicationController
    before_action :authenticate_employer

    def show
        if current_employer
            @employer = current_employer
            render json: {
                user: @employer.as_json,
                jobs: @employer.jobs.as_json( :include => [:candidates] ),
                caregivers: @employer.caregivers.as_json,
                employer_reviews: @employer.employer_reviews.as_json,
                employer_favorites: @employer.employer_favorites.as_json,
                caregiver_reviews: @employer.caregiver_reviews.as_json
            }
        elsif current_caregiver
            # render json: current_caregiver
            # {
                # jobs: @jobs.as_json,
                # candidates: @candidates.as_json,
                # employers: @employers.as_json,
                # caregivers: @caregivers.as_json,
                # employer_reviews: @employer_reviews.as_json,
                # employer_favorites: @employer_favorites.as_json,
                # caregiver_reviews: @caregiver_reviews.as_json,
                # caregiver_favorites: @caregiver_favorites.as_json,
            # }
        end
    end

end
