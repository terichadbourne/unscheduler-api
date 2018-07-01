class DiscussionSerializer < ActiveModel::Serializer
  attributes :id, :title, :winner, :editable
  has_one :discussion_proposer
  has_many :users, through: :votes

  def editable
    scope == object.discussion_proposer
  end
end
