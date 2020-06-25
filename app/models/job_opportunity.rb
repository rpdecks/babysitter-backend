class JobOpportunity < ApplicationRecord
  belongs_to :job
  belongs_to :employer, class_name: 'User'
  belongs_to :caregiver, class_name: 'User', optional: true
end
