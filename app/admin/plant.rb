ActiveAdmin.register Plant do
  permit_params :name, :description, :category, :temperature_min, :temperature_max, :pluviometry, :sunshine_amount
end
