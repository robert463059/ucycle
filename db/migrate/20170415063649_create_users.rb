class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :forenames
      t.string :surname
      t.string :email
      t.string :username
      t.string :password
      t.string :address
      t.string :city
      t.string :county
      t.string :postal_code
      t.string :image

      t.timestamps
    end
  end
end
