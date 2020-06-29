class Employer < ApplicationRecord
    has_many :jobs
    has_many :job_opportunites
    has_many :caregivers, through: :jobs
    has_many :caregiver_reviews, through: :caregivers
    has_many :caregiver_favorites, through: :caregivers
    has_many :employer_favorites
    has_many :employer_reviews
    has_many :messages, through: :jobs
    has_secure_password

    validates :email, uniqueness: true
end
