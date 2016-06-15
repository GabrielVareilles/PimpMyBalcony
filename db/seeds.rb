# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# This is to truncate previous records.
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
[Department, Item, Balcony, Plant].map(&:truncate!)

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
#########################################################
