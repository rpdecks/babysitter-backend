class EmployerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :phone, :dob, :address, :bio, :smoker, :has_pets, :gender
  has_many :jobs 
  has_many :candidates
  has_many :employer_reviews
  has_many :employer_favorites
  has_many :caregiver_reviews
  has_many :messages

end