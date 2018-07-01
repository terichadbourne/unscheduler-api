# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :discussion
  validates :user_id, :discussion_id, presence: true
end
