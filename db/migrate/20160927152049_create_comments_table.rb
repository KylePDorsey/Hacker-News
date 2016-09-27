class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, presence: true
      t.integer :user_id, presence: true
      t.integer :post_id, presence: true

      t.timestamps(presence: true)
    end
  end
end
