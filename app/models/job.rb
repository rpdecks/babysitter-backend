class Job < ApplicationRecord
    belongs_to :caregiver, class_name: 'User', optional: true
    belongs_to :employer, class_name: 'User'

    # Validations
    # validates :start_time, :end_time, :desc, :total_children, :infants, :toddlers, :school_age, :employer_id, presence: true

end