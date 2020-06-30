class Job < ApplicationRecord
  belongs_to :caregiver, optional: true
  belongs_to :employer
  has_many :candidates
end
