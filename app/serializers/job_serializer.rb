class Api::V1::JobSerializer < ActiveModel::Serializer
  attributes :id, :employer_id, :status, :location, :start_time, :end_time, :desc, :total_child_count, :infant_count, :toddler_count, :school_age_count, :completed, :pay_rate, :smoker, :first_aid_cert, :caregiver_id, :title
  belongs_to :employer
  belongs_to :caregiver, optional: true
end
