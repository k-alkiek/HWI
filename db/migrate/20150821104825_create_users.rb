class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :FName
      t.String :LName
      t.String :Gender
      t.date :Birthdate
      t.String :Email
      t.string :Password
      t.text :Bio

      t.timestamps
    end
  end
end
