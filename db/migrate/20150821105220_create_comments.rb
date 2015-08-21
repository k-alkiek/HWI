class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :User_id
      t.integer :reviews_id
      t.text :body

      t.timestamps
    end
  end
end
