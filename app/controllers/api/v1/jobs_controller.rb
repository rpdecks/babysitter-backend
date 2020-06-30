class Api::V1::JobsController < ApplicationController
  before_action :authenticate_employer, only: [:create, :update, :destroy]
  before_action :find_job, only: [:update, :destroy]

  def create
    @job = Job.new(job_params) 
    if current_employer
      @job.employer_id = current_employer.id
      @job.save
        if @job.persisted?
          render :json => @job, :status => :ok
        else
          render :json => { msg: "Job Creation Failed." }, :status => :bad_request
        end
    else
      render :json => { msg: "Job Creation Failed." }, :status => :bad_request
    end
  end

  def update
    if @job.save
      render :json => @job, :status => :ok
    else
      render :json => { msg: "Job update failed." }, :status => :bad_request
    end
  end

  def destroy
    @job.destroy
    if @job.persisted?
      render :json => { msg: "Delete failed!"}, :status => :bad_request
    else
      render :json => { msg: "Job was deleted!"}, :status => :ok
    end
  end

  private 

  def job_params
    params.require(:job).permit(:title, :status, :location, :start_time, :end_time, :desc, :total_child_count, :infant_count, :toddler_count, :school_age_count, :pay_rate, :smoker, :first_aid_cert)
  end

  def find_job 
    @job = Job.find_by(id: params[:id])
    if !@job
      render :json => { msg: "Could not find job" }, :status => :bad_request
    else
        return @job
    end
  end

end
