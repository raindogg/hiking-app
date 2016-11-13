class User < ApplicationRecord
  has_secure_password
  has_many :treks
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "hiker.png" 
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def total_distance
    total = 0
    treks.each do |trek|
      if !trek.length.nil?
        total += trek.length
      end
    end
    (total / 1609.344).round(2)
  end
end
