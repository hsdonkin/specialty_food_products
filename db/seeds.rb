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
User.destroy_all

50.times do
  faker_username = Faker::Internet.username
  faker_email = Faker::Internet.email
  faker_password = Faker::Internet.password
  user = User.new(:username => faker_username, :email => faker_email, :password => faker_password)
  user.save
end

# Make one admin account
user = User.new(:username => "admin", :email => "admin@admin.com", :password => "admin")
user.save

10.times do
  Country.create!(:name => Faker::Address.country)
end

100.times do
  @countries = Country.all
  random_country_index = rand(9)
  # this gets the collection of all countries available, then generates a random index number
  # the index number is then selected from countries
  # this future proofs the database, because you can't just select a random ID with rand(10), because the next time it is seeded the IDs will be incremented by 10
  product = Product.create!(:name => Faker::Food.ingredient, :cost => Faker::Number.decimal(l_digits: 2, r_digits: 2), :country_id => @countries[random_country_index].id)

  5.times do
    #product here is whatever product is created in the major loop
    # find a random user from all users
    user = User.all.sample
    # if it gets the admin account back, just go and find another account
    while user.username == "admin"
      user = User.all.sample
    end

    user.reviews.create!(:content_body => Faker::GreekPhilosophers.quote, :rating => (1+ rand(5)), :product_id => product.id)
  end
end
