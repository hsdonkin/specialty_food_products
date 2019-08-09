class ProductReviewJeviewJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :product_reviews do |t|
      t.belongs_to :products
      t.belongs_to :reviews
    end
  end
end
