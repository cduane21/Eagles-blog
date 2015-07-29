class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :comment_text
      t.string :user_name
      t.timestamp :date

      t.timestamps null: false
    end
  end
end
