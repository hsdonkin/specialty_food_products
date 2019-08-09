# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Country.destroy_all
Product.destroy_all
Review.destroy_all

10.times do
  Country.create!(:name => Faker::Address.country)
end

10.times do
  @countries = Country.all
  random_country_index = rand(9)
  # this gets the collection of all countries available, then generates a random index number
  # the index number is then selected from countries
  # this future proofs the database, because you can't just select a random ID with rand(10), because the next time it is seeded the IDs will be incremented by 10
  Product.create!(:name => Faker::Food.ingredient, :cost => Faker::Number.decimal(l_digits: 2, r_digits: 2), :country_id => @countries[random_country_index].id)
end
