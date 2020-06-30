class Api::V1::EmployerFavoriteSerializer < ActiveModel::Serializer
  attributes :id, :caregiver_id, :employer_id
  belongs_to :caregiver
  belongs_to :employer
end
