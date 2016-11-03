class Category < ApplicationRecord
  has_many :trek_categories
  has_many :treks, through: :trek_categories
end
