class Product < ApplicationRecord
  has_many :reviews
  belongs_to :country_of_origin
  before_save {self.name.titleize!}

  validates :name, presence: true
  validates :country_id, presence: true
  validates :price, presence: true
end
