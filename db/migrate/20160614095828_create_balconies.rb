class CreateBalconies < ActiveRecord::Migration
  def change
    create_table :balconies do |t|
      t.string :name
      t.string :type
      t.string :address
      t.string :city
      t.integer :department
      t.integer :length
      t.integer :width
      t.string :photo
      t.integer :storey
      t.string :orientation
      t.string :house_type
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
