require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'validity' do
    it 'review will be valid' do
      # none of the shoulda matchers methods work
      product = FactoryBot.create(:product)
      user = FactoryBot.create(:user)
      review = user.reviews.new(:product_id => product.id, :content_body => Faker::Hipster.paragraph, :rating => 4)
      expect(review.valid?).to eq(true)
    end
  end
end
