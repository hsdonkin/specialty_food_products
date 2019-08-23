require 'rails_helper'
require 'factory_bot'
require 'spec_helper'



describe Product, type: :model do

  before(:each) do
    Product.destroy_all
    Country.destroy_all
    Review.destroy_all
    User.destroy_all
  end

  it "will be a valid product" do
    # FactoryBot not working
    # ActiveRecord::RecordInvalid:
    #    Validation failed: Name has already been taken
    # country = FactoryBot.build(:country)
    # product = FactoryBot.build(:product)
    country = Country.new(:name => "Iceland")
    country.save
    product = Product.new(:name => "Spaghetti", :cost => 12.99)
    product.country_id = country.id
    product.save
    expect(product.valid?).to eq(true)
  end
end
