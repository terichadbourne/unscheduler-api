# frozen_string_literal: true

class DiscussionSerializer < ActiveModel::Serializer
  attributes :id, :title, :winner, :editable, :vote_counts, :votes
  has_one :discussion_proposer
  has_many :users, through: :votes

  def vote_counts
    counts = {}
    object.users.each do |voter|
      if counts[voter.id]
        counts[voter.id] += 1
      else
        counts[voter.id] = 1
      end
    end
    counts
  end

  def editable
    scope == object.discussion_proposer
  end
end
