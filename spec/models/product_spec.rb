require 'rails_helper'
require 'factory_bot'
require 'spec_helper'



describe Product, type: :model do

  before(:each)do
    Product.destroy_all
  end

  it "will be a valid product" do
    product = FactoryBot.create(:product)
    expect(product.valid?).to eq(true)
  end
end
