class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true

  def self.find_and_sort(ingredients)
    self.order(:name).find(ingredients)
  end
end
