require 'rails_helper'
require 'factory_bot'

FactoryBot.find_definitions
RSpec.describe Country do
  it "will have a name" do
    country = FactoryBot.create(:country)
    expect(country.name).to match (/[a-z]+/)
  end

  it "will be a unique list of 10 countries" do
    duplicate = false
    names = []
    countries = FactoryBot.create_list(:country, 10)
    countries.each do |c|
      names.push(c.name)
      if names.count(c.name) > 1
        binding.pry
        duplicate = true
      end
    end
    expect(duplicate).to eq (false)
  end
end
