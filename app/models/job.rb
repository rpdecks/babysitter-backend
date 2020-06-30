class Job < ApplicationRecord
  include ActionView::Helpers::DateHelper
  belongs_to :caregiver, optional: true
  belongs_to :employer
  has_many :candidates

  def self.available_jobs
    Job.all.select{ |job| !job.caregiver_id }
  end

  def duration
    distance_of_time_in_words(self.start_time, self.end_time)
  end
end
