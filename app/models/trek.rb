class Trek < ApplicationRecord
  belongs_to :user
  has_many :points
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def image_from_url(url)
    self.image = open(url)
  end

  def set_points
    # this is kind of annoying - digital globe/geojson uses it in longitude/latitude format, rather than lat/lon. 
    point_coordinates = []
    points.each do |point|
      point_coordinates << [point.longitude.to_f,point.latitude.to_f]
    end
    point_coordinates
  end

  def generate_url
    base = "https://api.mapbox.com/v4/digitalglobe.nal0g75k/geojson(%7B%22type%22%3A%22Feature%22%2C%22properties%22%3A%7B%22stroke-width%22%3A6%2C%22stroke%22%3A%22%23ff4444%22%2C%22stroke-opacity%22%3A0.8%7D%2C%22geometry%22%3A%7B%22type%22%3A%22LineString%22%2C%22coordinates%22%3A"
    key = ENV['DIGITAL_GLOBE_KEY']
    first_lat = set_points[0][0]
    first_lon = set_points[0][1]
    coordinates = set_points.to_s.gsub(" ", "")
    specs = "%7D%7D)/#{first_lat},#{first_lon},15/500x500.jpg90?access_token="
    url = base + URI.encode(coordinates, "[] ,") + specs + key
    url
  end


end
