class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :star
      t.references :balcony, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
