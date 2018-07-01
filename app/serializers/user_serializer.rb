# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :discussions_proposed
  has_many :discussions, through: :votes
end
