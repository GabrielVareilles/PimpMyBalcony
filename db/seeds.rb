
##########################  RESET  DATABASE  ###############

# This is to truncate previous records. => RESET ALL DATA
# class ActiveRecord::Base
#   def self.truncate!
#     connection.execute("TRUNCATE #{table_name} RESTART IDENTITY CASCADE;")
#   end
# end

# # Not allowed in production for obvious reasons.
# if Rails.env.in?(%(production)) && !ENV['FORCE']
#   STDERR.write "That's a terrible idea, all your records will be lost!!!\n"
#   exit
# end

# # We truncate the records so to regenerate the seed.
# # Each time we seed all the items are lost and recreated.
# [Department, Item, Balcony, Plant, User].map(&:truncate!)

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

user4 = User.new(
email: "tintin@gmail.com",
first_name: "Tintin",
last_name: "Herge",
password: "123456",
password_confirmation: "123456"
)
user4.save!

user5 = User.new(
email: "Jack@gmail.com",
first_name: "Jack",
last_name: "Houille",
password: "123456",
password_confirmation: "123456"
)
user5.save!

user6 = User.new(
email: "billyj@gmail.com",
first_name: "Billy",
last_name: "Jean",
password: "123456",
password_confirmation: "123456"
)
user6.save!

user7 = User.new(
email: "Johnsmith@gmail.com",
first_name: "John",
last_name: "Smith",
password: "123456",
password_confirmation: "123456"
)
user7.save!

user8 = User.new(
email: "mickey@gmail.com",
first_name: "Mickey",
last_name: "Oneil",
password: "123456",
password_confirmation: "123456"
)
user8.save!


user9 = User.new(
email: "Arlette@gmail.com",
first_name: "Arlette",
last_name: "La Belette",
password: "123456",
password_confirmation: "123456"
)
user9.save!

##########################   Balcony  SEED    ###############

balcony1 = Balcony.new(
name: "Jojo's balcony",
model: 'small',
address: '50 avenue roger Salengro, 59170, Croix',
city: 'Croix',
department: 59170,
length: 100,
width: 30,
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


balcony4 = Balcony.new(
name: "Tintin's balcony",
model: 'small',
address: '4 boulevard Léon Bureau, 44200, Nantes',
city: 'Nantes',
department: 44200,
length: 100,
width: 30,
orientation: 'south',
user_id: user4.id,
storey: 4,
house_type: "house"
)
balcony4.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466423844/balcony3_pj0luf.jpg'
balcony4.save


balcony5 = Balcony.new(
name: "Jack's balcony",
model: 'medium',
# 'small', 'medium', 'large'
address: '7 rue des paradoux, 31000, Toulouse',
city: 'Toulouse',
department: 31000,
length: 200,
width: 60,
orientation: 'North',
user_id: user5.id,
storey: 4,
house_type: "flat"
)
balcony5.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466423825/balcony5_bum7jj.jpg'
balcony5.save

balcony6 = Balcony.new(
name: "Billy's balcony",
model: 'large',
# 'small', 'medium', 'large'
address: '27 rue du vieil hôpital, 67000, Strasbourg',
city: 'Strasbourg',
department: 67000,
length: 400,
width: 600,
orientation: 'West',
user_id: user6.id,
storey: 6,
house_type: "flat"
)
balcony6.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466423743/balcony9_ltxtwg.jpg'
balcony6.save


balcony7 = Balcony.new(
name: "John Smith's balcony",
model: 'small',
address: '26 rue des tanneurs, 35700, Rennes',
city: 'Rennes',
department: 35700,
length: 100,
width: 30,
orientation: 'south',
user_id: user7.id,
storey: 4,
house_type: "house"
)
balcony7.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466426784/balcony14_xdcgij.jpg'
balcony7.save

balcony8 = Balcony.new(
name: "Mickael Oneil's balcony",
model: 'medium',
# 'small', 'medium', 'large'
address: '92 avenue About, 59240, Dunkerque',
city: 'Dunerque',
department: 59240,
length: 200,
width: 60,
orientation: 'North',
user_id: user8.id,
storey: 4,
house_type: "flat"
)
balcony8.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466427755/balcon24_yvcbsd.jpg'
balcony8.save

balcony9 = Balcony.new(
name: "Arlette's balcony",
model: 'large',
# 'small', 'medium', 'large'
address: '95 rue Garibaldi, 69006 Lyon',
city: 'Lyon',
department: 69006,
length: 400,
width: 600,
orientation: 'East',
user_id: user9.id,
storey: 6,
house_type: "flat"
)
balcony9.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466427756/balcony2_acgh8v.jpg'
balcony9.save

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

# category:  ,
# # deco pot plant
# sub_category: ,
# # deco => furniture, accessories ,
# # pot => round pot , Window box , Ground box
# # plant => herbs, bush, flower ,

item1 = Item.new(
name: "Smiley terracotta pot",
description: "The terracotta flower pot Smiley, range Serax, is a timeless pot plants ... with that little extra that gives the banana!
This terracotta flower pot is pierced, you only have to deposit balls of clay, soil and your plants, of course :)",
category: "Pot",
sub_category: "Round pot",
plant_category: "herbs, bush",
slot: 1,
price: 3.90,
volume: 10,
length: 20,
width: 20,
weight: 2.5,
)
item1.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466002731/1_e8kgiq.jpg'
item1.save

item2 = Item.new(
name: "Light coral terracotta pot",
description: "The terracotta pot cache is a nice object measuring 13 cm high with a diameter of 13cm. It is a perfect pot for your regular rounded aromatic plantations, do not you think? At Brin Garden, we advise you to keep your original aromatic pot (or your flowering plant, it works too!) That you will position directly in the container pot.",
category: "Pot",
sub_category: "Round pot",
plant_category: "herbs, bush",
slot: 1,
price: 5.90,
volume: 10,
length: 13,
width: 13,
weight: 2.5,
)
item2.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466003239/2_yctrfs.jpg'
item2.save

item3 = Item.new(
name: "Flower black fiber balcony",
description: "The look very graphic of the rectangular fiber planter can just as easily blend into a green atmosphere or be part of a contemporary decor.",
category: "Pot",
sub_category: "Window box",
plant_category: "flowers",
slot: 3,
price: 49,
volume: 30,
length: 60,
width: 20,
weight: 5,
)
item3.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466003630/4_zn6dgq.jpg'
item3.save


item4 = Item.new(
name: "Black fiberstone pot",
description: "
The matt black pot Pax Pots Pottery is designed Fiberstone, a mixture of fiberglass and stone powder. This combination is as elegant as sturdy to stand unflinchingly 4 seasons of weather.",
category: "Pot",
sub_category: "Round pot",
plant_category: "herbs, bush",
slot: 1,
price: 129,
volume: 20,
length: 67,
width: 67,
weight: 8,
)
item4.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466003352/3_itudgn.jpg'
item4.save

item5 = Item.new(
name: "Olivier on stem",
description: "The olivier is a nice rounded shape in leafy shrub that gives the impression of having been carved. Decorative guaranteed results! And its small size makes it ideal for terraces and balconies.",
category: "Plant",
sub_category: "bush",
plant_category: "bush",
slot: 1,
price: 99,
volume: 20,
length: 30,
width: 30,
weight: 3,
)
item5.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466004334/olijf_hz0jfr.jpg'
item5.save

item6 = Item.new(
name: "Mint herbs",
description: "Mints are a genus (Mentha) of perennial herbaceous plants of the family Lamiaceae (Labiatae), subfamily Nepetoideae, tribe Menthae, including many species, many of which are grown as aromatic and spice plants, ornamental or medicinal.",
category: "Plant",
sub_category: "Herbs",
plant_category: "Herbs",
slot: 1,
price: 14.90,
volume: 5,
length: 15,
width: 15,
weight: 1,
)
item6.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/c_scale,w_778/v1466004588/munt_pqqmo7.jpg'
item6.save


item7 = Item.new(
name: "Hibiscus flowers",
description: "These are plants known since ancient times: it was cultivated in Egypt and Southeast Asia for their ornamental character, but for their edible fruit. Many species also have medicinal properties. Imported to Europe in the twelfth century by the Moors of Spain, some species were subsequently introduced in America in the seventeenth century by slaves.",
category: "Plant",
sub_category: "Flower",
plant_category: "Flower",
slot: 1,
price: 39,
volume: 10,
length: 30,
width: 30,
weight: 1.8,
)
item7.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466005065/Guzmania_Ass_P13_snfzvw.jpg'
item7.save


item8 = Item.new(
name: "The pink flamingo",
description: "Flamingo (Phoenicopterus roseus) is the species of flamingo most widespread. Formerly Flamingo designated species Phoenicopterus ruber, which was the case here this subspecies Phoenicopterus ruber roseus",
category: "Deco",
sub_category: "Accessories",
plant_category: "",
slot: 1,
price: 99,
volume: 10,
length: 60,
width: 60,
weight: 1.2,
)
item8.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466005415/flamingo_r0zrl1.jpg'
item8.save

item9 = Item.new(
name: "Balcony Swing",
description: "The swing is a game, usually outdoors, which involves swinging on a board hanging on a porch. A traditional swing consists of a seat suspended from two ropes. They are found in kindergartens, and sometimes in circuses.",
category: "Deco",
sub_category: "Accessories",
plant_category: "",
slot: 1,
price: 59,
volume: 20,
length: 20,
width: 10,
weight: 2,
)
item9.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466005684/schommel_yjqoti.jpg'
item9.save

item10 = Item.new(
name: "Barbecue",
description: "The barbecue is a cooking appliance. Food is placed on a grid or on a spindle and are exposed to radiation from a heat source. The prepared food is also called 'grilling'. The cooking is normally carried out in the open.",
category: "Deco",
sub_category: "Accessories",
plant_category: "",
slot: 1,
price: 129,
volume: 40,
length: 40,
width: 40,
weight: 5,
)
item10.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466005791/bbq_jh1byn.jpg'
item10.save


item11 = Item.new(
name: "Ground box black fiber",
description: "The groundbox wicker basket is a nice object measuring 60 cm width.",
category: "Pot",
sub_category: "Ground box",
plant_category: "plant, bush",
slot: 6,
price:75000,
volume: 30,
length: 60,
width: 60,
weight: 4.5,
)
item11.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466433476/plato_iwifxy.jpg'
item11.save

item12 = Item.new(
name: "Groundbox wicker basket ",
description: "The groundbox wicker basket is a nice object measuring 20 cm high width a diameter of 13cm. It is a perfect backet for 2 bush plantations. At Brin Garden, we advise you to keep your original aromatic pot (or your flowering plant, it works too!) That you will position directly in the container pot.",
category: "Pot",
sub_category: "Ground box",
plant_category: "plant, bush",
slot: 2,
price: 25000,
volume: 10,
length: 13,
width: 20,
weight: 2.5,
)
item12.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466433786/groundboxsolo_zg6qti.jpg'
item12.save

item13 = Item.new(
name: "Blackgroundbox",
description: "The look very graphic of the rectangular fiber planter can just as easily blend into a green atmosphere or be part of a contemporary decor.",
category: "Pot",
sub_category: "Ground box",
plant_category: "plant, bush",
slot: 4,
price: 49000,
volume: 30,
length: 60,
width: 40,
weight: 5,
)
item13.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466435920/table-de-culture-90-x-60-cm-anthracite_dt2r70.jpg'
item13.save

# itemX = Item.new(
# name: "",
# description: "",
# category: "Pot",
# sub_category: "Round pot",
# plant_category: "herbs, bush",
# slot: 1,
# price: 129,
# volume: 20,
# length: 67,
# width: 67,
# weight: 8,
# )
# itemX.remote_photo_url = ''
# itemX.save

##########################   Plant  SEED    ###############

plant1 = Plant.new(
name: "Olivier",
scientific_name: "Olivium verdi",
description: "The olivier is a nice rounded shape in leafy shrub that gives the impression of having been carved. Decorative guaranteed results! And its small size makes it ideal for terraces and balconies.",
category: "Plant",
temperature_min: 10,
temperature_max: 45,
pluviometry: 1,
sunshine_amount: 4,
advises: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
price: 99,
slot: 1,
color: "green",
size: 120
)
plant1.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466004334/olijf_hz0jfr.jpg'
plant1.save

plant2 = Plant.new(
name: "Mint herbs",
scientific_name: "Holywood Chewing gum",
description: "Mints are a genus (Mentha) of perennial herbaceous plants of the family Lamiaceae (Labiatae), subfamily Nepetoideae, tribe Menthae, including many species, many of which are grown as aromatic and spice plants, ornamental or medicinal.",
category: "Plant",
temperature_min: 4,
temperature_max: 25,
pluviometry: 4,
sunshine_amount: 3,
advises: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
price: 5,
slot: 1,
color: "green",
size: 15
)
plant2.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/c_scale,w_778/v1466004588/munt_pqqmo7.jpg'
plant2.save

plant3 = Plant.new(
name: "Hibiscus flowers",
description: "These are plants known since ancient times: it was cultivated in Egypt and Southeast Asia for their ornamental character, but for their edible fruit. Many species also have medicinal properties. Imported to Europe in the twelfth century by the Moors of Spain, some species were subsequently introduced in America in the seventeenth century by slaves.",
category: "Plant",
temperature_min: 0,
temperature_max: 35,
pluviometry: 2,
sunshine_amount: 3,
advises: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
price: 5,
slot: 1,
color: "red",
size: 15
)
plant3.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466005065/Guzmania_Ass_P13_snfzvw.jpg'
plant3.save




# create_table "plants", force: :cascade do |t|
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



##########################   Schema    ###############
#
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
