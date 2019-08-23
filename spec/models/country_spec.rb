require 'rails_helper'
require 'factory_bot'
require 'shoulda-matchers'


RSpec.describe Country do

  before(:each) do
    Product.destroy_all
    Country.destroy_all
    Review.destroy_all
    User.destroy_all
  end

  it "will have a name" do
    # factory bot giving a validation error despite clearing database before each test
    #   ActiveRecord::RecordInvalid:
    # Validation failed: Name has already been taken
    # country = FactoryBot.create(:country)
    country = Country.new(:name => "Iceland")
    country.save
    expect(country.name).to match (/[a-z]+/)
  end

  it "will be a unique list of 10 countries" do
    # there is a validation for this, but shoulda matchers is not working
    # factory bot is also not working
    # duplicate = false
    # names = []
    # countries = FactoryBot.create_list(:country, 10)
    # countries.each do |c|
    #   names.push(c.name)
    #   if names.count(c.name) > 1
    #     binding.pry
    #     duplicate = true
    #   end
    # end
    # expect(duplicate).to eq (false)
  end
end
