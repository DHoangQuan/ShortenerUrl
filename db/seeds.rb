# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  name: 'first user',
  email: 'abc@gmail.com',
  password: 12345678
)

10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 12345678,
  )
end

100.times do
  params = {
    link: Faker::Internet.url
  }
  user_id = User.all.sample(1).first.id
  LinkOperations::CreateLink.new(params, user_id).execute
end

100.times do
  params = {
    id: Link.all.sample(1).first.id
  }
  LinkStatService.new(params).execute
end
