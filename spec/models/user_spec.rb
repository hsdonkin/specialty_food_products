require 'rails_helper'
require 'shoulda-matchers'
require 'factory_bot'

# FactoryBot.find_definitions

RSpec.describe User, type: :model do

  before(:each) do
    Product.destroy_all
    Country.destroy_all
    Review.destroy_all
    User.destroy_all
  end

  describe 'validity' do
    it 'user will be valid' do
      # none of the shoulda matchers methods work
      # it {should have_many(:reviews).class_name('Review')}
      # Factorybot had to be taken offline :/
      # it wouldn't stop trying to make things
      # user = FactoryBot.create(:user)
      user = User.new(:username => "Big Al", :email => "bigal@gmail.com", :password => "isecretlylove50cent")
      user.save
      expect(user.valid?).to eq(true)
    end
  end

end
