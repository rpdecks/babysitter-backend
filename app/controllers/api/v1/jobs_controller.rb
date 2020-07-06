require 'pry'

class Api::V1::JobsController < ApplicationController
  before_action :authenticate_employer, only: [:create, :update, :destroy]
  before_action :find_job, only: [:update, :destroy]

  def create
    if current_employer
    # merging date and time from form here into a single table value (start_time and end_time)
    job_start_time = Time.parse("#{job_params[:start_date]} #{job_params[:start_time]}")
    job_end_time = Time.parse("#{job_params[:start_date]} #{job_params[:start_time]}")

    # create job with params  
    @job = Job.new(job_params)
    @job.start_time = job_start_time
    @job.end_time = job_end_time

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
    if @job.update(job_params)
      render :json => @job, :status => :ok
    else
      render :json => { msg: "Job update failed." }, :status => :bad_request
    end
  end

  def destroy
    if @job.destroy
      render :json => { msg: 'Job was deleted!'}, :status => :ok
    else
      render :json => { msg: "Delete failed!"}, :status => :bad_request
    end
  end

  private 

  def job_params
    params.require(:job).permit(:title, :job_location, :start_time, :start_date ,:end_time, :end_date, :desc, :total_child_count, :infant_count, :toddler_count, :school_age_count, :pay_rate, :non_smoking, :first_aid_cert, :has_pets, :caregiver_id, :job_id)
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
