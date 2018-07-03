# frozen_string_literal: true

class DiscussionSerializer < ActiveModel::Serializer
  attributes :id, :title, :winner, :editable, :vote_counts, :votes, :current_user_session_votes, :current_user_total_votes, :current_user_votes_remaining, :can_upvote, :can_downvote
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

  def current_user_session_votes
    # assuming someone is logged in
    unless !scope
      # if they have votes on this session, return number of votes
      if vote_counts[scope.id]
        vote_counts[scope.id]
      # if they have no votes for this session, return 0
      else
        0
      end
    end
  end

  def current_user_total_votes
    if scope
      scope.votes.count
    end
  end

  def current_user_votes_remaining
    if scope
      5 - current_user_total_votes
    end
  end

  def can_downvote
    if scope
      current_user_session_votes >= 1
    end
  end

  def can_upvote
    if scope
      current_user_votes_remaining.positive?
    end
  end

end
