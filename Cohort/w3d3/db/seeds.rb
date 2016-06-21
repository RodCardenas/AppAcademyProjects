# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(:email=>'2@gmail.com')
User.create(:email=>'3@gmail.com')
User.create(:email=>'4@gmail.com')
User.create(:email=>'5@gmail.com')


ShortenedUrl.create_for_user_and_long_url!(User.all.sample, 'google.com')
ShortenedUrl.create_for_user_and_long_url!(User.all.sample, 'youtube.com')
ShortenedUrl.create_for_user_and_long_url!(User.all.sample, 'yahoo.com')
ShortenedUrl.create_for_user_and_long_url!(User.all.sample, 'gmail.com')
