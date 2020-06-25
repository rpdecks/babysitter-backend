class CaregiverReview < ApplicationRecord
  belongs_to :caregiver
  belongs_to :employer
end
