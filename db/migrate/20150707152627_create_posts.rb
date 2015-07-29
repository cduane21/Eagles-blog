class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :post_text
      t.string :user_name
      t.timestamp :date

      t.timestamps null: false
    end
  end
end
