# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :admin
  has_many :discussions_proposed
  has_many :discussions, through: :votes
  has_many :events
end
