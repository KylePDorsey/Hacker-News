class CreatePostsTable < ActiveRecord::Migration
  def change
      create_table :posts do |t|
      t.string :title, presence: true
      t.string :body, presence: true
      t.integer :user_id, presence: true

      t.timestamps(presence: true)
    end
  end
end
