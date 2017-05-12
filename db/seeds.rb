# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Tournament.destroy_all
10.times do
  User.create(
    name: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password
  )
end
u = User.create(
  name: 'Luis',
  lastname: 'Leiva',
  email: "lileiva@uc.cl",
  password: '123456'
)

user_ids = User.pluck(:id)
5.times do
  Tournament.create(
    name: Faker::LordOfTheRings.unique.location ,
    user_id: user_ids.sample
  )
end
1.times do
  Tournament.create(
    name: Faker::LordOfTheRings.unique.location ,
    user_id: u.id
  )
end


5.times do
  Team.create(
    name: Faker::Pokemon.unique.name ,
    group: ["A","B","C","D"].sample,
    dueno_id: user_ids.sample,
  )
end
1.times do
  Team.create(
    name: Faker::Pokemon.unique.name ,
    group: ["A","B","C","D"].sample,
    dueno_id: u.id
  )
end

