class AddUserIdAndLikesToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :user_id, :integer
    add_column :posts, :likes, :integer, default: 0, null: false

    add_index :posts, :user_id
    add_foreign_key :posts, :users
  end
end
