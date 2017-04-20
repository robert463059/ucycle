class CreatePostings < ActiveRecord::Migration[5.0]
  def change
    create_table :postings do |t|
    	t.integer :user_id
    	t.string :item_title
    	t.string :item_description
    	t.string :images
      	t.timestamps
    end
  end
end
