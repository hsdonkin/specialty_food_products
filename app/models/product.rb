class Product < ApplicationRecord
  has_many :reviews
  belongs_to :country
  before_save {self.name = self.name.titleize}

  validates :name, presence: true

  # this is country_of_origin, not country_of_origins_id because of some rails magic
  validates :country_id, presence: true

  validates :cost, presence: true

  scope :most_recent, -> {sort(created_at: :asc)}

  scope :usa_only, -> {where(country_id: Country.find_by_name("USA").id.to_s)}

end
