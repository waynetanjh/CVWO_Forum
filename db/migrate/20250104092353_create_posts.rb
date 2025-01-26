class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :post_title
      t.text :content
      t.string :topic
      t.timestamps
    end
  end
end
