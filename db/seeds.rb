# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Tournament.destroy_all
20.times do
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


10.times do
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

tournament_ids = Tournament.pluck(:id)
team_ids = Team.pluck(:id)
1.times do
  local = team_ids.sample
  visitor = team_ids.sample
  if local == visitor
    local = (local + 1) % u.id
  end
  Match.create(
    date: Faker::Date.backward(14) ,
    result:Team.find([local, visitor].sample).name,
    local_id: local,
    visitor_id: visitor,
    tournament_id: tournament_ids.sample
  )
end

