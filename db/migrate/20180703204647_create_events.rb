class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.boolean :proposals_open, default: true
      t.boolean :voting_open, default: false
      t.boolean :schedule_finalized, default: false

      t.timestamps
    end
  end
end
