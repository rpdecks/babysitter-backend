class Api::V1::AppStatusController < ApplicationController
    before_action :authenticate_employer
    before_action :authenticate_caregiver

    def show
        if current_employer
            @employer = current_employer
            render json: {
                user: @employer.as_json(:include => :employer_favorites, :methods => [:rating, :job_count]),
                jobs: @employer.jobs.as_json(:methods => [:duration, :start_time_HHMM, :end_time_HHMM, :start_date_YYYYMMDD, :end_date_YYYYMMDD]),
                caregivers: Caregiver.all.active.as_json(:include => :employer_reviews, :methods => [:rating, :job_count, :age]),
                employer_reviews: @employer.employer_reviews.as_json,
                employer_favorites: @employer.employer_favorites.as_json,
                caregiver_reviews: @employer.caregiver_reviews.as_json
            }
        elsif current_caregiver
            @caregiver = current_caregiver
            render json: {  
                user: @caregiver.as_json(:include => :caregiver_favorites, :methods => [:rating, :job_count]),
                jobs: @caregiver.jobs.as_json(:include => :candidates, :methods => 
                    [:duration, :start_time_HHMM, :end_time_HHMM, :start_date_YYYYMMDD, 
                    :end_date_YYYYMMDD]),
                interested_jobs: @caregiver.candidates.as_json(:only => :job_id),
                available_jobs: Job.all.available_jobs.as_json(:methods => [:duration, :start_time_HHMM, :end_time_HHMM, :start_date_YYYYMMDD, :end_date_YYYYMMDD]),
                employers: Employer.all.active.as_json(:include => :caregiver_reviews, :methods => [:job_count, :age]),
                caregiver_reviews: @caregiver.caregiver_reviews.as_json,
                caregiver_favorites: @caregiver.caregiver_favorites.as_json,
                employer_reviews: @caregiver.employer_reviews.as_json
            }
        end
    end

    def default_serializer_options
        {
          serializer: nil
        }
    end

end
