class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :max_votes, :proposals_open, :voting_open, :schedule_finalized, :user
end
