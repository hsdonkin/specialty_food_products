class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :content_body, presence: true, length: {minimum: 50, maximum: 250}
  validates :rating, presence: true, numericality: { only_integer: true, minimum: 1, maximum: 5 }
end
