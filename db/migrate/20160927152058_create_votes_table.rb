class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voteable_id, presence: true
      t.string :voteable_type, presence: true

      t.timestamps(presence: true)
    end
  end
end
