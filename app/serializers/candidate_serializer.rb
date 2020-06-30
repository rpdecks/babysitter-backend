class Api::V1::CandidateSerializer < ActiveModel::Serializer
  attributes :id, :caregiver_id, :job_id
  belongs_to :job
  belongs_to :caregiver, optional: true
end
