class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.integer :number
      t.integer :temperature_min
      t.integer :temperature_max
      t.integer :pluviometry
      t.integer :sunshine_amount

      t.timestamps null: false
    end
  end
end
