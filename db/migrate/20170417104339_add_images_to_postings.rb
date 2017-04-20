class AddImagesToPostings < ActiveRecord::Migration[5.0]
  def change
    add_column :postings, :images, :json
  end
end
