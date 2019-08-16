class Country < ApplicationRecord
  has_many :products
  before_save {self.name = self.name.titleize}
end