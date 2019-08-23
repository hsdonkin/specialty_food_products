require 'rails_helper'

RSpec.describe Review, type: :model do

  before(:each) do
    Product.destroy_all
    Country.destroy_all
    Review.destroy_all
    User.destroy_all
  end

  describe 'validity' do
    it 'review will be valid' do
      # none of the shoulda matchers methods work
      # factorybot is completely unreliable for some reason
      # country = FactoryBot.build(:country)
      # product = FactoryBot.build(:product)
      # user = FactoryBot.create(:user)
      country = Country.new(:name => "Iceland")
      product = country.products.new(:name => "Spaghetti", :cost => 12.99)
      user = User.new(:username => "Big Al", :email => "bigal@gmail.com", :password => "isecretlylove50cent")
      country.save
      product.save
      user.save
      # faker
      review = Review.new(:user_id => user.id, :product_id => product.id, :content_body => Faker::Lorem.paragraph_by_chars(number: 180, supplemental: false), :rating => 4)
      review.save
      expect(review.valid?).to eq(true)
    end
  end
end
