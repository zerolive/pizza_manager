class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true

  def self.find_and_sort(ingredients)
    self.order(:name).find(ingredients)
  end

  def self.unused(used)
    self.all.to_a.select do |ingredient|
      !used.include?(ingredient.id)
    end
  end
end
