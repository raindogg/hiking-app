class Trek < ApplicationRecord
  belongs_to :user
  has_many :points
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def image_from_url(url)
    self.image = open(url)
  end

  def set_points
    parameters = []
    points.each do |point|
      # use the weird syntax and shovel in each latitude and longitude
    end
    # shovel in the ending symbols 
  end

  # add a method that re-orders (through gsub) the url
end
