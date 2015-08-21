class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
     
      t.integer :Item_id
      t.string :title
      t.text :body
      t.integer :rating

      t.timestamps
    end
  end
end
