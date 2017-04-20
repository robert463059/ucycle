class RemoveImagesFromPostings < ActiveRecord::Migration[5.0]
  def change
    remove_column :postings, :images, :string
  end
end
