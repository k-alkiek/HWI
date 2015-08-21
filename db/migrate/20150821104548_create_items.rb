class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :Category_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
