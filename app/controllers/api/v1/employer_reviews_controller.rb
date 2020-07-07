class Api::V1::EmployerReviewsController < ApplicationController
    before_action :authenticate_employer, only: [:create, :update, :destroy]
    before_action :find_employer_review, only: [:update, :destroy]

    def create
        if current_employer
            @employer_review = EmployerReview.new(employer_review_params)
            @employer_review.employer_id = current_employer.id
            if @employer_review.save
                render :json => @employer_review, :status => :ok
            else
                render :json => { msg: "Review Creation Failed." }, :status => :bad_request
            end
        else
        render :json => { msg: "Job Creation Failed." }, :status => :bad_request
        end
    end

    def update
        if @employer_review.update(employer_review_params)
            render :json => @employer_review, :status => :ok
        else
            render :json => { msg: "Review update failed." }, :status => :bad_request
        end
    end

    def destroy
        if @employer_review.destroy
            render :json => { deleted: true, msg: 'Review was deleted!'}, :status => :ok
        else
            render :json => { msg: "Delete failed!"}, :status => :bad_request
        end
    end

    private 

    def employer_review_params
        params.require(:employer_review).permit(:title, :content, :rating, :id, :caregiver_id)
    end

    def find_employer_review 
        @employer_review = EmployerReview.find_by(id: params[:id])
        if !@employer_review
        render :json => { msg: "Could not find review" }, :status => :bad_request
        else
            return @employer_review
        end
    end
end