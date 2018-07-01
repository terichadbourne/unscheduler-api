# frozen_string_literal: true

class Discussion < ApplicationRecord
  belongs_to :discussion_proposer,
             class_name: 'User',
             foreign_key: 'user_id',
             inverse_of: 'discussions_proposed'
  validates :title, :discussion_proposer, presence: true
  validates :winner, inclusion: { in: [true, false] }
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes
end
