
##########################  RESET  DATABASE  ###############

# This is to truncate previous records. => RESET ALL DATA
class ActiveRecord::Base
  def self.truncate!
    connection.execute("TRUNCATE #{table_name} RESTART IDENTITY CASCADE;")
  end
end

# Not allowed in production for obvious reasons.
if Rails.env.in?(%(production)) && !ENV['FORCE']
  STDERR.write "That's a terrible idea, all your records will be lost!!!\n"
  exit
end

# We truncate the records so to regenerate the seed.
# Each time we seed all the items are lost and recreated.
[Department, Item, Balcony, Plant, User].map(&:truncate!)

##########################Department Seed###############

Paris = Department.new({
  number: 75,
  temperature_max: 26,
  temperature_min: 2,
  pluviometry: 635,
  sunshine_amount: 1662
  })
Paris.save

Lille = Department.new({
  number: 59,
  temperature_max: 23,
  temperature_min: 1,
  pluviometry: 635,
  sunshine_amount: 1662
  })
Lille.save


##########################   USER  Seed     ###############

user1 = User.new(
email: "jojo@gmail.com",
first_name: "Jojo",
last_name: "La fouine",
password: "123456",
password_confirmation: "123456"
)
user1.admin = true
user1.save!

user2 = User.new(
email: "Rene@gmail.com",
first_name: "Rene",
last_name: "La Taupe",
password: "123456",
password_confirmation: "123456"
)
user2.save!

user3 = User.new(
email: "Roger@gmail.com",
first_name: "Roger",
last_name: "Rabbit",
password: "123456",
password_confirmation: "123456"
)
user3.save!


##########################   Balcony  SEED    ###############

balcony1 = Balcony.new(
name: "Jojo's balcony",
model: 'small',
address: '50 avenue roger Sallengro, 59170, Croix',
city: 'Croix',
department: 59170,
length: 120,
width: 10,
orientation: 'south',
user_id: user1.id,
storey: 4,
house_type: "house"
)
balcony1.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1465992527/balcony22_bl1bva.jpg'
balcony1.save

balcony2 = Balcony.new(
name: "Rene's balcony",
model: 'medium',
# 'small', 'medium', 'large'
address: '22 rue jonquoy, 75014, Paris',
city: 'Paris',
department: 75014,
length: 200,
width: 60,
orientation: 'North',
user_id: user2.id,
storey: 4,
house_type: "flat"
)
balcony2.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1465992526/balcony15_v1qywc.jpg'
balcony2.save

balcony3 = Balcony.new(
name: "Roger's balcony",
model: 'large',
# 'small', 'medium', 'large'
address: '9 rue Charles François Dupuis, 75003 Paris',
city: 'Paris',
department: 75003,
length: 400,
width: 600,
orientation: 'West',
user_id: user3.id,
storey: 6,
house_type: "flat"
)
balcony3.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1465992527/balcony24_tbummp.jpg'
balcony3.save

##########################   Balcony_picture  SEED    ###############

# http://res.cloudinary.com/dun7rljns/image/upload/v1465992526/balcony14_hsa5uw.jpg
#
# http://res.cloudinary.com/dun7rljns/image/upload/v1465992525/balcony9_gbvml7.jpg
#
# http://res.cloudinary.com/dun7rljns/image/upload/v1465992524/balcony6_nterxt.jpg
#
# http://res.cloudinary.com/dun7rljns/image/upload/v1465992525/balcony7_ufw4ye.jpg
#
# http://res.cloudinary.com/dun7rljns/image/upload/v1465992525/balcony8_pgnh7j.jpg


##########################   Item  SEED    ###############



##########################   Plant  SEED    ###############

#   enable_extension "plpgsql"
#
#   create_table "active_admin_comments", force: :cascade do |t|
#     t.string   "namespace"
#     t.text     "body"
#     t.string   "resource_id",   null: false
#     t.string   "resource_type", null: false
#     t.integer  "author_id"
#     t.string   "author_type"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

#   create_table "balconies", force: :cascade do |t|
#     t.string   "name"
#     t.string   "model"
#     t.string   "address"
#     t.string   "city"
#     t.integer  "department"
#     t.integer  "length"
#     t.integer  "width"
#     t.string   "photo"
#     t.integer  "storey"
#     t.string   "orientation"
#     t.string   "house_type"
#     t.integer  "user_id"
#     t.datetime "created_at",  null: false
#     t.datetime "updated_at",  null: false
#     t.float    "latitude"
#     t.float    "longitude"
#   end

#   create_table "departments", force: :cascade do |t|
#     t.integer  "number"
#     t.integer  "temperature_min"
#     t.integer  "temperature_max"
#     t.integer  "pluviometry"
#     t.integer  "sunshine_amount"
#     t.datetime "created_at",      null: false
#     t.datetime "updated_at",      null: false
#   end
#
#   create_table "items", force: :cascade do |t|
#     t.string   "name"
#     t.text     "description"
#     t.string   "category"
#     t.string   "sub_category"
#     t.string   "plant_category"
#     t.integer  "slot"
#     t.integer  "price"
#     t.integer  "volume"
#     t.integer  "length"
#     t.integer  "width"
#     t.integer  "weight"
#     t.string   "photo"
#     t.datetime "created_at",     null: false
#     t.datetime "updated_at",     null: false
#   end
#
#   create_table "plants", force: :cascade do |t|
#     t.string   "name"
#     t.text     "description"
#     t.string   "category"
#     t.integer  "temperature_min"
#     t.integer  "temperature_max"
#     t.integer  "pluviometry"
#     t.integer  "sunshine_amount"
#     t.string   "scientific_name"
#     t.integer  "fertiliser"
#     t.text     "advises"
#     t.integer  "price"
#     t.integer  "slot"
#     t.string   "photo"
#     t.string   "color"
#     t.string   "size"
#     t.datetime "created_at",      null: false
#     t.datetime "updated_at",      null: false
#   end
#
#   create_table "users", force: :cascade do |t|
#     t.string   "email",                  default: "",    null: false
#     t.string   "encrypted_password",     default: "",    null: false
#     t.string   "reset_password_token"
#     t.datetime "reset_password_sent_at"
#     t.datetime "remember_created_at"
#     t.integer  "sign_in_count",          default: 0,     null: false
#     t.datetime "current_sign_in_at"
#     t.datetime "last_sign_in_at"
#     t.inet     "current_sign_in_ip"
#     t.inet     "last_sign_in_ip"
#     t.datetime "created_at",                             null: false
#     t.datetime "updated_at",                             null: false
#     t.boolean  "admin",                  default: false, null: false
#     t.string   "provider"
#     t.string   "uid"
#     t.string   "picture"
#     t.string   "first_name"
#     t.string   "last_name"
#     t.string   "token"
#     t.datetime "token_expiry"
# #
