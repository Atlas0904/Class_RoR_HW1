class AddPostsTable < ActiveRecord::Migration
  def change
    create_table :post do |t|
      t.string   :title
      t.text      :content
      t.integer :user_id

      t.timestamp 
    end
  end
end
