# frozen_string_literal: true

class Discussion < ApplicationRecord
  belongs_to :user
  validates :title, :user, presence: true
  validates :winner, inclusion: { in: [true, false] }
end
