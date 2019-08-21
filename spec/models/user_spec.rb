require 'rails_helper'
require 'shoulda-matchers'
require 'factory_bot'

FactoryBot.find_definitions

RSpec.describe User, type: :model do

  before(:each) do
    User.destroy_all
  end

  describe 'validity' do
    it 'user will be valid' do
      # none of the shoulda matchers methods work
      # it {should have_many(:reviews).class_name('Review')}
      user = FactoryBot.create(:user)
      expect(user.valid?).to eq(true)
    end
  end

end
