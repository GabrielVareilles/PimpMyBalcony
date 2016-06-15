ActiveAdmin.register User do
permit_params :email, :first_name, :last_name, :admin

index do
    selectable_column
    column :id
    column :email
    column :first_name
    column :last_name
    column :created_at
    column :admin
    actions
  end

  form do |f|
      f.inputs "Identity" do
        f.input :first_name
        f.input :last_name
        f.input :email
      end
      f.inputs "Admin" do
        f.input :admin
      end
      f.actions
  end

# "email",                  default: "",    null: false
# t.string   "encrypted_password",     default: "",    null: false
# t.string   "reset_password_token"
# t.datetime "reset_password_sent_at"
# t.datetime "remember_created_at"
# t.integer  "sign_in_count",          default: 0,     null: false
# t.datetime "current_sign_in_at"
# t.datetime "last_sign_in_at"
# t.inet     "current_sign_in_ip"
# t.inet     "last_sign_in_ip"
# t.datetime "created_at",                             null: false
# t.datetime "updated_at",                             null: false
# t.boolean  "admin",                  default: false, null: false
# t.string   "provider"
# t.string   "uid"
# t.string   "picture"
# t.string   "first_name"
# t.string   "last_name"
# t.string   "token"
# t.datetime "token_expiry"

end
