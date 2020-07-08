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
        if ratings.length > 0
            user_rating = ratings.reduce(:+) / ratings.length.to_f
            return user_rating.round(1)
        else
            return 0
        end
    end

    def job_count
        completed_jobs = self.jobs.select{ |job| job.status == "complete"}
        return completed_jobs.length
    end

    def age
        Time.now.year - self.dob.year
    end
end
