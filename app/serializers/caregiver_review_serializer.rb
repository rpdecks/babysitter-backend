class Api::V1::CaregiverReviewSerializer < ActiveModel::Serializer
  attributes :id, :caregiver_id, :employer_id, :rating, :content
  belongs_to :caregiver
  belongs_to :employer
end