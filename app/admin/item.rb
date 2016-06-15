ActiveAdmin.register Item do

permit_params :name, :description, :category, :sub_category, :plant_category, :slot, :price, :volume, :length, :width, :weight, :photo

end
