ActiveAdmin.register Balcony do
  permit_params :name, :model, :address, :city, :department, :length, :width, :photo, :storey, :orientation, :house_type 
end
