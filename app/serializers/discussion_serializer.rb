class DiscussionSerializer < ActiveModel::Serializer
  attributes :id, :title, :winner, :editable
  has_one :user

  def editable
    scope == object.user
  end
end
