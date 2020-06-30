class Api::V1::CandidatesController < ApplicationController
    before_action :authenticate_caregiver, only: [:create, :destroy]

    def create
        if current_caregiver
            @candidate = Candidate.find_by(job_id: candidate_params[:job_id], caregiver_id: current_caregiver.id)
            if @candidate
                if @candidate.destroy
                render :json => { created: false, job_id: candidate_params[:job_id] }, :status => :ok
                end
            else
                @candidate = Candidate.new(candidate_params)
                @candidate.caregiver_id = current_caregiver.id
                if @candidate.persisted?
                    render :json => { created: true, job_id: candidate_params[:job_id] }, :status => :ok
                end
            end
        else
            render :json => { msg: "Job interest NOT saved" }, :status => :bad_request
        end
    end

    private

    def candidate_params
      params.require(:candidate).permit(:job_id, :caregiver_id)
    end
end
