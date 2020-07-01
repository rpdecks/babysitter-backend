class Job < ApplicationRecord
  include ActionView::Helpers::DateHelper
  belongs_to :caregiver, optional: true
  belongs_to :employer
  has_many :candidates

  def self.available_jobs
    Job.all.select{ |job| !job.caregiver_id }
  end

  def duration
    # distance_of_time_in_words(self.start_time, self.end_time)
    diff_in_seconds = self.end_time - self.start_time
    hours = diff_in_seconds.to_f / 3600
    return hours.to_f
  end
end
