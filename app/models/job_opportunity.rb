class JobOpportunity < ApplicationRecord
  belongs_to :employer
  belongs_to :caregiver
end
