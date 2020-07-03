class Job < ApplicationRecord
  include ActionView::Helpers::DateHelper
  belongs_to :caregiver, optional: true
  belongs_to :employer
  has_many :candidates, dependent: :destroy

  def self.available_jobs
    Job.all.select{ |job| !job.caregiver_id }
  end

  def duration
    distance_of_time_in_words(self.start_time, self.end_time)
  end

  def start_time_HHMM  
    self.start_time.strftime("%H:%M")
  end

  def end_time_HHMM  
    self.end_time.strftime("%H:%M")
  end 

  def start_date_YYYYMMDD
    self.start_time.strftime("%Y-%m-%d")
  end

  def end_date_YYYYMMDD
    self.end_time.strftime("%Y-%m-%d")
  end

end
