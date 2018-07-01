# frozen_string_literal: true

class VoteSerializer < ActiveModel::Serializer
  attributes :id, :editable
  has_one :user
  has_one :discussion

  def editable
    scope == object.user
  end
end
