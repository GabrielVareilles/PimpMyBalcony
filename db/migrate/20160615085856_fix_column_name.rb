class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :balconies, :type, :model
  end
end
