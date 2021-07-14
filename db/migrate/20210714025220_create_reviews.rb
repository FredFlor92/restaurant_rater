class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.string :title
      t.string :content
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps
    end
  end
end
