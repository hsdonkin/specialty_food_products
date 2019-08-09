class CountryOfOrigin < ApplicationRecord
  has_many :products
  before_save {self.name.titleize!}
end
