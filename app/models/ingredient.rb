class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
end
