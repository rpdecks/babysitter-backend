class Caregiver < ApplicationRecord
    has_many :jobs
    has_many :candidates, dependent: :destroy
    has_many :employers, through: :jobs
    has_many :employer_reviews, through: :employers, dependent: :destroy
    has_many :employer_favorites, through: :employers
    has_many :caregiver_favorites, dependent: :destroy
    has_many :caregiver_reviews, dependent: :destroy
    has_many :messages, through: :jobs
    has_secure_password

    def self.active
        Caregiver.all.select{ |caregiver| caregiver.status == 'active' }
    end

    def rating
        ratings = self.employer_reviews.map { |review| review.rating }
        user_rating = ratings.reduce(:+) / ratings.length.to_f
    end
end
