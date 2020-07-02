class Api::V1::JobsController < ApplicationController
  before_action :authenticate_employer, only: [:create, :update, :destroy]
  before_action :find_job, only: [:update, :destroy]

  def create
    # merging date and time from form here into a single table value (start_time and end_time)
    job_start_time = Time.parse("#{job_params[:start_date]} #{job_params[:start_time]}")
    job_end_time = Time.parse("#{job_params[:start_date]} #{job_params[:start_time]}")

    # create job with params
    @job = Job.new(job_params)
    # trim data for storage in db
    @job = @job.attributes.except('end_date', 'start_date')
    @job.start_time = job_start_time
    @job.end_time = job_end_time

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
    params.require(:job).permit(:title, :status, :location, :start_time, :end_time, :start_date, :end_date, :desc, :total_child_count, :infant_count, :toddler_count, :school_age_count, :pay_rate, :smoker, :first_aid_cert, :has_pets)
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
