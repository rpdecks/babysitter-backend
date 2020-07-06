class Api::V1::CaregiverReviewsController < ApplicationController
    before_action :authenticate_caregiver, only: [:create, :update, :destroy]

    def create
        if current_caregiver
            @caregiver_review = CaregiverReview.new(caregiver_review_params)
            @caregiver_review.caregiver_id = current_caregiver.id
            if @caregiver_review.save
                render :json => @caregiver_review, :status => :ok
            else
                render :json => { msg: "Review Creation Failed." }, :status => :bad_request
            end
        else
        render :json => { msg: "Job Creation Failed." }, :status => :bad_request
        end
    end

    def update
        if @caregiver_review.update(caregiver_review_params)
            render :json => @caregiver_review, :status => :ok
        else
            render :json => { msg: "Review update failed." }, :status => :bad_request
        end
    end

    def destroy
        if @caregiver_review.destroy
            render :json => { msg: 'Review was deleted!'}, :status => :ok
        else
            render :json => { msg: "Delete failed!"}, :status => :bad_request
        end
    end

    private 

    def caregiver_review_params
        params.require(:caregiver_review).permit(:title, :content, :rating, :id, :employer_id)
    end

    def find_employer_review 
        @caregiver_review = CaregiverReview.find_by(employer_id: params[:employer_id])
        if !@caregiver_review
        render :json => { msg: "Could not find review" }, :status => :bad_request
        else
            return @caregiver_review
        end
    end
end