# frozen_string_literal: true

class DiscussionSerializer < ActiveModel::Serializer
  attributes :id, :title, :winner, :editable, :vote_counts, :votes, :current_user_votes
  has_one :discussion_proposer
  has_many :users, through: :votes

  def editable
    scope == object.discussion_proposer
  end

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

  def current_user_votes
    # if no one is logged in
    if !scope
      'no user logged in'
    # if someone is logged in and has votes on this session, return number of
    # votes
    elsif vote_counts[scope.id]
      vote_counts[scope.id]
    # if someone is logged in but has no votes for this session, return 0
    else
      0
    end
  end

end
