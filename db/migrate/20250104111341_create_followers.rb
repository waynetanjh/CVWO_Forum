class CreateFollowers < ActiveRecord::Migration[8.0]
  def change
    create_table :followers do |t|
      t.string :name
    end
  end
end
