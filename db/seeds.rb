User.create(email: "test@test.com", password: "password")

3.times do
  Board.create(name: Faker::Commerce.material, user_id: 1)
end

15.times do
  List.create(name: Faker::Restaurant.name, 
priority: [1,2,3,4,5].sample, board_id: [1,2,3].sample )

end

100.times do
  Task.create(name: Faker::Food.dish, 
  description: Faker::Food.description, 
  list_id: rand(1..15) )

end

puts "seeded."

