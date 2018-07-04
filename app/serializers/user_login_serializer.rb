# frozen_string_literal: true

class UserLoginSerializer < ActiveModel::Serializer
  attributes :id, :email, :admin, :token, :votes
  has_many :discussions_proposed
  has_many :discussions, through: :votes
  has_many :events

  def token
    Rails.application.message_verifier(:signed_token).generate(object.token)
  end
end
