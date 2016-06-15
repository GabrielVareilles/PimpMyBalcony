ActiveAdmin.register Balcony do
  permit_params :user_id, :name, :model, :address, :city, :department, :length, :width, :photo, :storey, :orientation, :house_type 
end
