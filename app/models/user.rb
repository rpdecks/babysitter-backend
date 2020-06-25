class User < ApplicationRecord
    # Jobs
    has_many :employer_jobs, class_name: 'Job', foreign_key: :employer_id
    has_many :caregiver_jobs, class_name: 'Job', foreign_key: :caregiver_id
    has_many :caregivers, through: :employer_jobs, source: :user
    has_many :employers, through: :caregiver_jobs, source: :user
    # Job Opportunities
    has_many :employer_opportunities, class_name: 'JobOpportunity', foreign_key: :employer_id
    has_many :caregiver_opportunities, class_name: 'JobOpportunity', foreign_key: :caregiver_id
    # Reviews
    has_many :reviews_of_others, class_name: 'Reviews', foreign_key: :reviewer_id
    has_many :reviews_of_self, class_name: 'Reviews', foreign_key: :reviewed_id
    # Favorites
    has_many :favorites
    has_many :favorited
    # Conversations
    has_many :participants
    has_many :conversations, through: :participants
    has_many :messages

    # Validations
    validates :first_name, :last_name, :gender, :email, :phone, :dob, :smoker, :address, :has_pets, presence: true 
    validates :dob, presence: true
    validate :validate_age
    # validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }

    private

    def validate_age
        if dob.present? && dob > 18.years.ago.to_d
            errors.add(:birth_date, 'You should be over 18 years old.')
        end
    end
end