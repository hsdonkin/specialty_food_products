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
user = User.new(:username => "admin", :email => "admin@admin.com", :password => "adminadmin")
user.admin = true
user.save

10.times do
  Country.create!(:name => Faker::Address.country)
end

# USA! USA! USA!
Country.create!(:name => "USA")

100.times do
  @country = Country.all.sample

  # this gets the collection of all countries available, then picks a random country
  product = @country.products.create!(:name => Faker::Food.ingredient, :cost => Faker::Number.decimal(l_digits: 2, r_digits: 2))

  (rand(10) + 1).times do
    #product here is whatever product is created in the major loop
    # find a random user from all users
    user = User.all.sample
    # if it gets the admin account back, just go and find another account
    while user.username == "admin"
      user = User.all.sample
    end

    user.reviews.create(:content_body => Faker::Hipster.paragraph, :rating => (1+ rand(5)), :product_id => product.id)
  end
end
