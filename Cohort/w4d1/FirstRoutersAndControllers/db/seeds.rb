# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

ActiveRecord::Base.transaction do

  10.times do
    User.create!(name: Faker::Name.name, email: Faker::Internet.email, username: Faker::Internet.user_name)
  end

  100.times do |i|
    Contact.create!(name: Faker::Name.name, email: Faker::Internet.email, user_id: i % 10 + 1)
  end

  100.times do
    ContactShare.create!(contact_id: (rand(100)+1), user_id: (rand(10)+1))
  end

end
