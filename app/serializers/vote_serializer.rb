# frozen_string_literal: true

class VoteSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :discussion
end
