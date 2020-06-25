class Caregiver < ApplicationRecord
    has_many :jobs
    has_many :job_opportunites
    has_many :employers, through: :jobs
    has_many :employer_reviews, through: :employers
    has_many :employer_favorites, through: :employers
    has_many :caregiver_favorites
    has_many :caregiver_reviews
    has_many :messages, through: :jobs
end
