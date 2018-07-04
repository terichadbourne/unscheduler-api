class AddMaxVotesToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :max_votes, :integer
  end
end
