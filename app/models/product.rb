class Product < ApplicationRecord
  has_many :reviews
  belongs_to :country
  before_save {self.name = self.name.titleize}

  validates :name, presence: true

  # this is country_of_origin, not country_of_origins_id because of some rails magic
  # validates :country_of_origin, presence: true

  validates :cost, presence: true
end
