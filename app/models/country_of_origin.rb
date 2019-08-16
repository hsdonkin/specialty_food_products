class Country < ApplicationRecord
  has_many :products
  before_save {self.name = self.name.titleize}

    validates :name, presence: true
end
