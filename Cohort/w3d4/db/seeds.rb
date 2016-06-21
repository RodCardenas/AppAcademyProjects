# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |n|
  User.create!(user_name: Faker::Name.name)
end

5.times do |n|
  Poll.create!(author_id: 1 + rand(10),title: Faker::Company.buzzword)
end

5.times do |n|
  Question.create!(poll_id: 1 + rand(5),text: Faker::Hacker.say_something_smart + "?")
end

Question.all.each do |ques|
  4.times do |n|
    AnswerChoice.create!(question_id: ques[:id], text: Faker::Hacker.adjective + " " + Faker::Hacker.noun )
  end
end

rand(30).times do |n|
  Response.create!(user_id: 1 + rand(10), answer_choice_id: 1 + rand(5))
end
