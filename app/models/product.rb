class Product < ApplicationRecord
  has_many :reviews
  belongs_to :country
  before_save {self.name = self.name.titleize}

  validates :name, presence: true

  # this is country_of_origin, not country_of_origins_id because of some rails magic
  validates :country_id, presence: true

  validates :cost, presence: true

  scope :most_recent, -> {order(:created_at).limit(5)}

  scope :usa_only, -> {where(country_id: Country.find_by_name("USA").id.to_s)}


  # scope :most_reviewed -> {where()}
  # ok so there is not really a great way to do most reviewed, documentation suggests counter_cache: true but that doesn't really work for some reason

  def self.most_reviewed
    # get all the products
    products = Product.all
    most_reviewed_product = nil
    most_reviewed_count = 0
    products.each do |p|
      # establish how many reviews there are for the product
      current_review_count = p.reviews.count
      # if this product has more reviews than the currently most reviewed product, update that variable
      if current_review_count > most_reviewed_count
        most_reviewed_product = p
        most_reviewed_count = current_review_count
      end
    end
    return most_reviewed_product
  end

  # finds all ratings, sums them, then divides sum by review count
  def average_rating
    reviews = self.reviews
    rating_sum = 0
    reviews.each do |r|
      rating_sum += r.rating.to_i
    end
    rating = (rating_sum/(self.reviews.count).to_f).round(1)
    return rating
  end
end
