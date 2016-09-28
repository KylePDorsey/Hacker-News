class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, presence: true
      t.string :password_hash, presence: true

      t.timestamps(presence: true)
    end
  end
end
