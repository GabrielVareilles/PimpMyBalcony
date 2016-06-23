
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
[Department, Item, Balcony, Plant, User, Cart].map(&:truncate!)

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
email: "Reneda@gmail.com",
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
model: 'large',
address: '12 rue des tours, 59800, Lille',
city: 'Croix',
department: 59800,
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
model: 'large',
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
model: 'large',
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
model: 'large',
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
model: 'large',
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
model: 'large',
# 'small', 'medium', 'large'
address: '92 avenue About, 59240, Dunkerque',
city: 'Dunkerque',
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

balcony10 = Balcony.new(
name: "Arlette's balcony",
model: 'small',
# 'small', 'medium', 'large'
address: '4 rue Marcel Proust, 45000 Orléans',
city: 'Orléans',
department: 45000,
length: 400,
width: 600,
orientation: 'East',
user_id: user9.id,
storey: 6,
house_type: "flat"
)
balcony10.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466611886/small_balcony3_ct9f7j.jpg'
balcony10.save

balcony11 = Balcony.new(
name: "Arlette's balcony",
model: 'small',
# 'small', 'medium', 'large'
address: '22 rue Buirette, 51100 Reims',
city: 'Reims',
department: 51100,
length: 400,
width: 600,
orientation: 'East',
user_id: user9.id,
storey: 6,
house_type: "flat"
)
balcony11.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466611886/balcony_small2_hxahqg.jpg'
balcony11.save

balcony12 = Balcony.new(
name: "Arlette's balcony",
model: 'small',
# 'small', 'medium', 'large'
address: '120 rue Foch, 34000 Montpellier',
city: 'Montpellier',
department: 34000,
length: 400,
width: 600,
orientation: 'East',
user_id: user9.id,
storey: 6,
house_type: "flat"
)
balcony12.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466611886/balcon_small1_vrt8vn.jpg'
balcony12.save

balcony13 = Balcony.new(
name: "Jack's balcony",
model: 'medium',
# 'small', 'medium', 'large'
address: '13 rue Faventines, 26000, Valence',
city: 'Valence',
department: 26000,
length: 200,
width: 60,
orientation: 'North',
user_id: user5.id,
storey: 4,
house_type: "flat"
)
balcony13.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466611879/balcony_medium2_f27acw.jpg'
balcony13.save

balcony14 = Balcony.new(
name: "Jack's balcony",
model: 'medium',
# 'small', 'medium', 'large'
address: '61 Rue du Porteau, 86000, Poitiers',
city: 'Poitiers',
department: 86000,
length: 200,
width: 60,
orientation: 'North',
user_id: user5.id,
storey: 4,
house_type: "flat"
)
balcony14.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466611878/balcony_medium1_vnfszu.jpg'
balcony14.save

balcony15 = Balcony.new(
name: "Jack's balcony",
model: 'medium',
# 'small', 'medium', 'large'
address: '54 Rue de Pessac, 33000, Bordeaux',
city: 'Bordeaux',
department: 33000,
length: 200,
width: 60,
orientation: 'North',
user_id: user5.id,
storey: 4,
house_type: "flat"
)
balcony15.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466611879/balcony_medium3_bq7xbu.jpg'
balcony15.save

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
price_cents: 390,
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
price_cents: 590,
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
slot: 2,
price_cents: 4900,
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
price_cents: 12900,
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
price_cents: 9900,
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
price_cents: 1490,
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
price_cents: 3900,
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
price_cents: 9900,
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
price_cents: 5900,
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
price_cents: 12900,
volume: 40,
length: 40,
width: 40,
weight: 5,
)
item10.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466005791/bbq_jh1byn.jpg'
item10.save


item11 = Item.new(
name: "Ground natural wood box",
description: "The groundbox wicker basket is a nice object measuring 60 cm width.",
category: "Pot",
sub_category: "Ground box",
plant_category: "plant, bush",
slot: 6,
price_cents: 7500,
volume: 30,
length: 60,
width: 60,
weight: 4.5,
)
item11.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466671746/groundbox9_b0ujmk.jpg'
item11.save

item12 = Item.new(
name: "Groundbox wicker basket ",
description: "The groundbox wicker basket is a nice object measuring 20 cm high width a diameter of 13cm. It is a perfect backet for 2 bush plantations. At Brin Garden, we advise you to keep your original aromatic pot (or your flowering plant, it works too!) That you will position directly in the container pot.",
category: "Pot",
sub_category: "Ground box",
plant_category: "plant, bush",
slot: 2,
price_cents: 2500,
volume: 10,
length: 13,
width: 20,
weight: 2.5,
)
item12.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466667981/zukeg28anqvc3l7w5g9l.jpg'
item12.save

item13 = Item.new(
name: "Blackgroundbox",
description: "The look very graphic of the rectangular fiber planter can just as easily blend into a green atmosphere or be part of a contemporary decor.",
category: "Pot",
sub_category: "Ground box",
plant_category: "plant, bush",
slot: 4,
price_cents: 4900,
volume: 30,
length: 60,
width: 40,
weight: 5,
)
item13.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466435920/table-de-culture-90-x-60-cm-anthracite_dt2r70.jpg'
item13.save


item14 = Item.new(
name: "Tomato plants",
description: "It’s easy to grow tomato plants in pots. To get the most from container-grown tomatoes, you need to match the eventual size of your plant tomato plants to the overall size of your container. For instance, smaller varieties are well suited to hanging baskets or window boxes, whereas you might want to choose a sturdier planter or 5-gallon bucket for larger types.",
category: "Plant",
sub_category: "herbs",
slot: 1,
price_cents: 950,
volume: 20,
length: 30,
width: 30,
weight: 3,
)
item14.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466436921/tomate_ctx3fv.jpg'
item14.save


item15 = Item.new(
name: "White oudoor fiber window box ",
description: "You can hang the flower box and plant pot from a balcony rail and create a decorative garden, even on a small space.",
category: "Pot",
sub_category: "Window box",
plant_category: "flowers",
slot: 6,
price_cents: 5500,
volume: 30,
length: 60,
width: 20,
weight: 5,
)
item15.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466498275/potsmultiple_fclhgc.jpg'
item15.save


item16 = Item.new(
name: "Flower box with holder ",
description: "You can hang the flower box and plant pot from a balcony rail and create a decorative garden, even on a small space.",
category: "Pot",
sub_category: "Window box",
plant_category: "flowers",
slot: 2,
price_cents: 1500,
volume: 30,
length: 20,
width: 10,
weight: 5,
)
item16.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466498275/multiwindowbox_uzjqms.jpg'
item16.save


item17 = Item.new(
name: "Multi color flower box",
description: "You can hang the flower box and plant pot from a balcony rail and create a decorative garden, even on a small space.",
category: "Pot",
sub_category: "Window box",
plant_category: "flowers",
slot: 3,
price_cents: 2000,
volume: 40,
length: 40,
width: 10,
weight: 5,
)
item17.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466498274/colorwindowbox_ozffjy.jpg'
item17.save


item18 = Item.new(
name: "Watering can, outdoor, grey",
description: "You can store water or a nutrient mixture in the can, so everything is ready when you water your plants.",
category: "Deco",
sub_category: "Accessories",
plant_category: "",
slot: 1,
price_cents: 1900,
volume: 20,
length: 20,
width: 10,
weight: 2,
)
item18.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466498274/arrosioir_uvhzer.jpg'
item18.save

item19 = Item.new(
name: "Tray, hanging, black/natural",
description: "Keep fresh herbs, spices, oil and vinegar close at hand with this hanging tray.",
category: "Deco",
sub_category: "Accessories",
plant_category: "",
slot: 1,
price_cents: 2500,
volume: 20,
length: 20,
width: 10,
weight: 2,
)
item19.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466498275/flowerplates_zwdc8k.jpg'
item19.save

item20 = Item.new(
name: "Plant support, black fiber",
description: "Keep your windowbox's fresh herbs, spices, oil and vinegar close at hand with this hanging tray.",
category: "Deco",
sub_category: "Accessories",
plant_category: "",
slot: 1,
price_cents: 2500,
volume: 20,
length: 20,
width: 10,
weight: 2,
)
item20.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466498275/supportwindowbox_hhpymm.jpg'
item20.save


item21 = Item.new(
name: "Plant stand with 5 plant pots, bamboo, white",
description: "A decorative ladder plant stand allows you to grow several plants together vertically – perfect if you like plants but live in a small space.",
category: "Deco",
sub_category: "Accessories",
plant_category: "",
slot: 5,
price_cents: 3500,
volume: 20,
length: 90,
width: 40,
weight: 3,
)
item21.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466500911/plantsstand_tg0ip0.jpg'
item21.save

item22 = Item.new(
name: "Bench, in/outdoor, orange",
description: "The bench is durable and easy to care for, as it is made of powder-coated steel. ",
category: "Deco",
sub_category: "Accessories",
plant_category: "",
slot: 5,
price_cents: 3500,
volume: 20,
length: 90,
width: 40,
weight: 3,
)
item22.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466498274/bancexterior_teskcz.jpg'
item22.save

item23 = Item.new(
name: "Beach chair, foldable light red",
description: "Enjoy relaxing with this awesome long chair 100% wood rainforest alliance",
category: "Deco",
sub_category: "Accessories",
plant_category: "",
slot: 1,
price_cents: 2490,
volume: 40,
length: 120,
width: 40,
weight: 5,
)
item23.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466501748/relax_p5koow.jpg'
item23.save


item24 = Item.new(
name: "Trolley, outdoor, white, eucalyptus brown stained",
description: "The Pimp My Ride trolley provides an extra storage area which can be moved easily.",
category: "Deco",
sub_category: "Accessories",
plant_category: "",
slot: 1,
price_cents: 8900,
volume: 60,
length: 81,
width: 51,
weight: 5,
)
item24.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466498274/bbqdesign_kzmwcy.jpg'
item24.save

item25 = Item.new(
name: "LED solar-powered pendant lamp",
description: "Adopt this amazing eco environmental globe blue/white for your balcony evenings.",
category: "Deco",
sub_category: "Accessories",
plant_category: "",
slot: 1,
price_cents: 700,
volume: 20,
length: 15,
width:10,
weight: 1,
)
item25.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466502517/solarlamp_ushbgz.jpg'
item25.save

item26 = Item.new(
name: "Lemon tree",
description: "Pimp My Ride trees from Lemon Citrus Tree are not grown from seed, they are grafted from mature trees unto a dwarf root stock. This allows you to see blossoms and fruit as early as one year old! Our trees are very hardy, of the best quality and have a three year warranty!",
category: "Plant",
sub_category: "bush",
plant_category: "bush",
slot: 1,
price_cents: 12000,
volume: 20,
length: 15,
width:10,
weight: 1,
)
item26.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466439020/citrus_wl14vw.jpg'
item26.save

item27 = Item.new(
name: "Grapefruit",
description: "The grapefruit (Citrus × paradisi) is a subtropical citrus tree known for its sour to semi-sweet fruit. Grapefruit is a hybrid originating in Barbados as an accidental cross between two introduced species, sweet orange and pomelo",
category: "Plant",
sub_category: "bush",
plant_category: "bush",
slot: 1,
price_cents: 15000,
volume: 20,
length: 15,
width:10,
weight: 1,
)
item27.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466436958/pamplemousse_ojw2vf.jpg'
item27.save

item28 = Item.new(
name: "palmier",
description: "Pimp My Ride trees from Lemon Citrus Tree are not grown from seed, they are grafted from mature trees unto a dwarf root stock. This allows you to see blossoms and fruit as early as one year old! Our trees are very hardy, of the best quality and have a three year warranty!",
category: "Plant",
sub_category: "bush",
plant_category: "bush",
slot: 1,
price_cents: 9500,
volume: 20,
length: 15,
width:10,
weight: 1,
)
item28.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466436938/chrysalidocarpus_rxexvn.jpg'
item28.save

item29 = Item.new(
name: "Buxus tree",
description: "Pimp My Ride Buxus sempervirens (common box) standards make superb specimen topiary plants. Box topiary standards can be grown in containers/planters or in the ground as specimens plants.",
category: "Plant",
sub_category: "bush",
plant_category: "bush",
slot: 1,
price_cents: 11500,
volume: 20,
length: 15,
width:10,
weight: 1,
)
item29.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466437027/buis_ioavfr.jpg'
item29.save

item30 = Item.new(
name: "Bamboo",
description: "Pimp My Ride Evergreen bamboo plants offer a thick lush hedge that offers total privacy and they take up very little planting area widthwise. The lush green leaves offer an exotic edge to your garden design with tall upright evergreen lines of green, yellow or black canes. This type of planting is particularly useful when delicately screening off the close proximity of neighbours.",
category: "Plant",
sub_category: "bush",
plant_category: "bush",
slot: 1,
price_cents: 9500,
volume: 20,
length: 15,
width:10,
weight: 1,
)
item29.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466440709/bamboo_aurtmj.jpg'
item29.save


# itemX = Item.new(
# name: "",
# description: "",
# category: "Pot",
# sub_category: "Round pot",
# plant_category: "herbs, bush",
# slot: 1,
# price_cents: 129,
# volume: 20,
# length: 67,
# width: 67,
# weight: 8,
# )
# itemX.remote_photo_url = ''
# itemX.save

##########################   Plant  SEED    ###############

plant1 = Plant.new(
name: "Tomato plants",
scientific_name: "Tomato ruby",
description: "It’s easy to grow tomato plants in pots. To get the most from container-grown tomatoes, you need to match the eventual size of your plant tomato plants to the overall size of your container. For instance, smaller varieties are well suited to hanging baskets or window boxes, whereas you might want to choose a sturdier planter or 5-gallon bucket for larger types.",
category: "Fruit",
temperature_min: 10,
temperature_max: 45,
pluviometry: 1,
sunshine_amount: 700,
advises: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
price_cents: 950,
slot: 1,
color: "green",
size: 120
)
plant1.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466514314/tomato_plant_xer9y8.jpg'
plant1.save

plant2 = Plant.new(
name: "Mint herbs",
scientific_name: "Holywood Chewing gum",
description: "Mints are a genus (Mentha) of perennial herbaceous plants of the family Lamiaceae (Labiatae), subfamily Nepetoideae, tribe Menthae, including many species, many of which are grown as aromatic and spice plants, ornamental or medicinal.",
category: "Herb",
temperature_min: 4,
temperature_max: 25,
pluviometry: 4,
sunshine_amount: 3,
advises: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
price_cents: 400,
slot: 1,
color: "green",
size: 15
)
plant2.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466514487/Peppermint_foo29a.jpg'
plant2.save

plant3 = Plant.new(
name: "Hibiscus flowers",
description: "These are plants known since ancient times: it was cultivated in Egypt and Southeast Asia for their ornamental character, but for their edible fruit. Many species also have medicinal properties. Imported to Europe in the twelfth century by the Moors of Spain, some species were subsequently introduced in America in the seventeenth century by slaves.",
category: "Flower",
temperature_min: 0,
temperature_max: 35,
pluviometry: 2,
sunshine_amount: 3,
advises: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
price_cents: 500,
slot: 1,
color: "red",
size: 15
)
plant3.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466514780/Hibiscus-Red_abxmqk.jpg'
plant3.save

plant4 = Plant.new(
name: "Strawberry plants",
scientific_name: "Fragaria × ananassa",
description: "Fresh strawberries grown in gardens or on local farms can be harvested at the peak of ripeness, offering superior flavor, quality, and appearance. We offer three main types — short-day or June-bearing, day-neutral, and alpine strawberries. Choose from disease-free, dormant bare-root plants of the first two types, seeds of the second two types, and certified-organic plugs of day-neutral varieties.",
category: "Fruit",
temperature_min: 10,
temperature_max: 35,
pluviometry: 1,
sunshine_amount: 3,
advises: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
price_cents: 750,
slot: 1,
color: "red",
size: 120
)
plant4.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466518236/strawberry-plant_rpjsgg.jpg'
plant4.save


plant5 = Plant.new(
name: "Basil herbs",
scientific_name: "Basilicus pistus",
description: "Grow fresh basil herbs at home with zero effort. No green thumb required!",
category: "Herb",
temperature_min: 4,
temperature_max: 25,
pluviometry: 4,
sunshine_amount: 3,
advises: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
price_cents: 600,
slot: 1,
color: "green",
size: 15
)
plant5.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466514956/basilum_izbgzl.jpg'
plant5.save


plant6 = Plant.new(
name: "Dill herbs",
scientific_name: "Anethum graveolens",
description: "The compact plants has a lot of large, succulent, dark green leaves with purple-bluish tint",
category: "Herb",
temperature_min: 4,
temperature_max: 25,
pluviometry: 4,
sunshine_amount: 3,
advises: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
price_cents: 700,
slot: 1,
color: "green",
size: 15
)
plant6.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466515361/dill_lcpjyw.jpg'
plant6.save

plant7 = Plant.new(
name: "Chives herbs",
scientific_name: "Allium schoenoprasum",
description: "They are one of the first herbs to pop up in the spring garden, they are in season (and blooming!) right now, and they are pretty much the easiest herb to grow.",
category: "Herb",
temperature_min: 4,
temperature_max: 25,
pluviometry: 4,
sunshine_amount: 3,
advises: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
price_cents: 500,
slot: 1,
color: "green",
size: 15
)
plant7.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466516122/chiveherbs_la4kwr.jpg'
plant7.save


plant8 = Plant.new(
name: "Tulip",
scientific_name: "Tulipus",
description: "You'll love this fabulous assortment of tulip bulbs, so new they have yet to be named. Every single flower is different - in variety, color and form. Our special tulip breeder has selected many thousands of new seedlings and included the best in this mixture.",
category: "Flower",
temperature_min: 10,
temperature_max: 40,
pluviometry: 2,
sunshine_amount: 4,
advises: "This spectacular mix will bloom mid to late spring and are great for cutting.",
price_cents: 800,
slot: 1,
color: "green",
size: 15
)
plant8.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466673130/tulip_o35qn6.jpg'
plant8.save

plant9 = Plant.new(
name: "Sage blue",
scientific_name: "Salvia azurea",
description: "The bright blue flowers of Blue Sage bloom for an extended period in late summer. Native to southern and western prairie states, it makes its home in rocky prairies, shaded limestone glades, and open woodlands.",
category: "Flower",
temperature_min: 10,
temperature_max: 40,
pluviometry: 2,
sunshine_amount: 4,
advises: "Salvia azurea is tough as nails and makes an excellent choice for dry sites.",
price_cents: 1250,
slot: 1,
color: "green",
size: 15
)
plant9.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466679854/sage_blue_lqv7mp.jpg'
plant9.save

plant10 = Plant.new(
name: "oleander",
scientific_name: "oleandus",
description: "Large clusters of large fragrant soft rosy white double flowers, often with one or more petals streaked or flecked with white, are born over a long period on this reliable old favorite.",
category: "Flower",
temperature_min: 10,
temperature_max: 35,
pluviometry: 2,
sunshine_amount: 3,
advises: "Oleanders also make excellent container specimens that are easily overwintered indoors in cooler climates.",
price_cents: 9500,
slot: 1,
color: "green",
size: 15
)
plant10.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466436938/chrysalidocarpus_rxexvn.jpg'
plant10.save


plant11 = Plant.new(
name: "Raspberry bush",
scientific_name: "Raspus",
description: "Pimp My Ride Dorman Red is a good raspberry for the deep South. Produces good quantities of large, firm, juicy, red fruit, very good either fresh or frozen.",
category: "Fruit",
temperature_min: 10,
temperature_max: 35,
pluviometry: 2,
sunshine_amount: 3,
advises: "Thrives in hot temperatures, drought and disease resistant. Ripens mid June. ",
price_cents: 1050,
slot: 1,
color: "green",
size: 15
)
plant11.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466681727/raspberry_tdnt38.jpg'
plant11.save

# plant12 = Plant.new(
# name: "Bamboo",
# scientific_name: "Bambus",
# description: "Pimp My Ride Evergreen bamboo plants offer a thick lush hedge that offers total privacy and they take up very little planting area widthwise. The lush green leaves offer an exotic edge to your garden design with tall upright evergreen lines of green, yellow or black canes. This type of planting is particularly useful when delicately screening off the close proximity of neighbours.",
# category: "Plant",
# temperature_min: 10,
# temperature_max: 35,
# pluviometry: 2,
# sunshine_amount: 3,
# advises: "Select a container at least 45cm (18in) in diameter and use a loam-based compost, such as John Innes No 3. Make sure plants never dry out, even in winter.",
# price_cents: 11500,
# slot: 1,
# color: "green",
# size: 15
# )
# plant12.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466440709/bamboo_aurtmj.jpg'
# plant12.save

plant8 = Plant.new(
name: "Hortensia flowers",
description: "These are plants known since ancient times: it was cultivated in Egypt and Southeast Asia for their ornamental character, but for their edible fruit. Many species also have medicinal properties. Imported to Europe in the twelfth century by the Moors of Spain, some species were subsequently introduced in America in the seventeenth century by slaves.",
category: "Flower",
temperature_min: 0,
temperature_max: 35,
pluviometry: 3,
sunshine_amount: 3,
advises: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
price_cents: 1500,
slot: 1,
color: "white",
size: 15
)
plant8.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466504265/hortensia_sj2bua.jpg'
plant8.save

plant9 = Plant.new(
name: "Daisy flowers",
description: "For a spectacular show during cool weather, plant marguerite daisy. Often confused with Shasta daisy, marguerite is more mounded and shrubby. Different types also come in pink with a bloom that more resembles purple coneflower.",
category: "Flower",
temperature_min: 0,
temperature_max: 35,
pluviometry: 3,
sunshine_amount: 3,
advises: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
price_cents: 1800,
slot: 1,
color: "pink, white",
size: 15
)
plant9.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466504265/marguerite_daisy_mu0udh.jpg'
plant9.save

plant10 = Plant.new(
name: " Graminae flowers",
description: "A charming, deciduous grass that forms a compact, low mound and produces long-lasting, soft, pinkish, brush-like flowers in late summer that resemble squirrel tails. The bright green leaves turn yellow in autumn. It’s a fairly undistinguished plant until the flowers appear, so use it alongside spring bulbs or early-flowering perennials.",
category: "Flower",
temperature_min: 0,
temperature_max: 35,
pluviometry: 3,
sunshine_amount: 3,
advises: "Remove dead foliage in spring.",
price_cents: 1490,
slot: 1,
color: "green",
size: 15
)
plant10.remote_photo_url = 'http://res.cloudinary.com/dun7rljns/image/upload/v1466505501/graminae_lah7xo.jpg'
plant10.save



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
#     t.integer  "price_cents"
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
#     t.integer  "price_cents"
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
#     t.integer  "price_cents"
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
