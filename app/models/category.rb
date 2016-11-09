class Category < ApplicationRecord
  has_many :trek_categories
  has_many :treks, through: :trek_categories

  def self.unique_categories
    collection = []
    categories = Category.all
    categories.each do |category|
      if collection.index(category.name).nil? && !category.treks.length.zero?
        collection << category.name
      end
    end
    collection
  end
end
