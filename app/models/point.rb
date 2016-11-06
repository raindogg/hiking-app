class Point < ApplicationRecord
  belongs_to :trek

  def friendly_time
    created_at.strftime("%B %e, %Y")    
  end

  def lat_and_lon
    "#{latitude}, #{longitude}"
  end
end
