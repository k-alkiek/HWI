class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :FName
      t.string :LName
      t.string :Gender
      t.date :Birthdate
      t.string :Email
      t.string :Password
      t.text :Bio

      t.timestamps
    end
  end
end
