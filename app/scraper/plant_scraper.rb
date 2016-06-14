require 'open-uri'
require 'nokogiri'
require 'json'

id = rand(1000..9900)

html_file = open("https://myflowerpower.parrot.com/#plantdb/#{id}")
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.page-ttl.lib-detail > div > div > h2').each do |element|
  puts element.text
end

# exemple :
# memory = []
# memory << {name: element.text}
# html_doc.search('#paginate .last').each do |element|
#   last_page_number = element.attribute('href').text.match(/pageNumber=(\d+)/)[1].to_i

# plant table Model
# create_table "plants", force: :cascade do |t|
#   t.string   "name"
#   t.text     "description"
#   t.string   "category"
#   t.integer  "temperature_min"
#   t.integer  "temperature_max"
#   t.integer  "pluviometry"
#   t.integer  "sunshine_amount"
#   t.string   "scientific_name"
#   t.integer  "fertiliser"
#   t.text     "advises"
#   t.integer  "price"
#   t.integer  "slot"
#   t.string   "photo"
#   t.string   "color"
#   t.string   "size"
#   t.datetime "created_at",      null: false
#   t.datetime "updated_at",      null: false
# end
