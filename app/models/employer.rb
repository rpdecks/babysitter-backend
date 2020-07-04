class Employer < ApplicationRecord
    has_many :jobs
    has_many :candidates
    has_many :caregivers, through: :jobs
    has_many :caregiver_reviews, through: :caregivers
    has_many :caregiver_favorites, through: :caregivers
    has_many :employer_favorites
    has_many :employer_reviews
    has_many :messages, through: :jobs
    has_secure_password

    validates :email, uniqueness: true

    def self.active
        Employer.all.select{ |employer| employer.status == 'active' }
    end

    def rating
        ratings = self.caregiver_reviews.map { |review| review.rating }
        user_rating = ratings.reduce(:+) / ratings.length.to_f
    end
end
