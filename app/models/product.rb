class Product < ApplicationRecord
  has_many :reviews
  belongs_to :country_of_origin
end
