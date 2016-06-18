ActiveAdmin.register Order do
  permit_params :order_number, :total, :shipping, :discount, :delivery_adress, :status
end
