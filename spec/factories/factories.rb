require 'rails_helper'
require 'faker'



# FactoryBot.define do
#   factory :user do
#     username {Faker::Internet.username}
#     email {Faker::Internet.email}
#     password {Faker::Internet.password}
#   end
# end
#
#
FactoryBot.define do
  factory :country do
    name {Faker::Address.country}
  end
end
#
# FactoryBot.define do
#   factory :review do
#     user = FactoryBot.create(:user)
#     product = FactoryBot.create(:product)
#     user_id { user.id }
#     rating { rand(1..5) }
#     content_body { Faker::Hipster.paragraph }
#     product_id { product.id }
#   end
# end
#
#
# FactoryBot.define do
#   factory :product do
#     country = FactoryBot.create(:country)
#     name { Faker::Food.ingredient }
#     cost { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
#     country_id { country.id }
#   end
# end
