class Trek < ApplicationRecord
  belongs_to :user
  has_many :points

  
end
