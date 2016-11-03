class TrekCategory < ApplicationRecord
  belongs_to :trek
  belongs_to :category
end
