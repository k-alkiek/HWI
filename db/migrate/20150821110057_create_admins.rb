class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :Username
      t.string :Password

      t.timestamps
    end
  end
end
