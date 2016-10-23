class User < ApplicationRecord
  has_secure_password
  has_many :treks

  def total_distance
    total = 0
    treks.each do |trek|
      if !trek.length.nil?
        total += trek.length
      end
    end
    total
  end
end
