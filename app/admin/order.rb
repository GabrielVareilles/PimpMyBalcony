ActiveAdmin.register Cart do
  permit_params :cart_number, :shipping, :discount, :delivery_adress, :status
end
