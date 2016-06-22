ActiveAdmin.register Order do
  permit_params :user_id, :amount
end
