class AddCoordinatesToBalconies < ActiveRecord::Migration
  def change
    add_column :balconies, :latitude, :float
    add_column :balconies, :longitude, :float
  end
end
