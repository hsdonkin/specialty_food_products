require 'rails_helper'
require 'factory_bot'

RSpec.describe Country do
  it "will have a name" do
    FactoryBot.find_definitions
    country = FactoryBot.create(:country)
    expect(country.name).to match (/[a-z]+/)
  end
end
