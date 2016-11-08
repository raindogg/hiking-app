class TrekCategory < ApplicationRecord
  belongs_to :trek
  belongs_to :category

  def find_category
    category = Category.find(category_id)
    category.name
  end
end
