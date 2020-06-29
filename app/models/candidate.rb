class Candidate < ApplicationRecord
  belongs_to :job
  belongs_to :caregiver, optional: true
end
