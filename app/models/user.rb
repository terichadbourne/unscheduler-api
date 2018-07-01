# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :discussions_proposed,
           class_name: 'Discussion',
           inverse_of: 'discussion_proposer'
  validates :name, presence: true
  has_many :votes, dependent: :destroy
  has_many :discussions, through: :votes
end
