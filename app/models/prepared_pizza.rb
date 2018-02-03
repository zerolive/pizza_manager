class PreparedPizza < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
