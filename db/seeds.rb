# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do
  User.create!(username: Faker::Name.last_name + "_" + Faker::Name.last_name, name: Faker::Name.name, password: "password", email: Faker::Internet.safe_email, picture_url: "https://unsplash.it/400/?image=1061", bio: Faker::Hipster.paragraph)
end

1000.times do
  Gleet.create!(body: Faker::Hipster.sentence, user_id: rand(1..100))
end

100.times do |i|
  10.times do
    j = rand(1..100)
    unless j == i
      Follow.create!(follower_type: "User", follower_id: i, followable_type: "User", followable_id: j)
    end
  end
end
