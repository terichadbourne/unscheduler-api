class ChangeColumnMaxVotesInEvents < ActiveRecord::Migration[5.1]
  def change
    change_column :events, :max_votes, :integer, default: 5
  end
end
