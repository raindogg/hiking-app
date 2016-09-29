class ChangeLongitueToLongitude < ActiveRecord::Migration[5.0]
  def change
    rename_column :points, :longitue, :longitude
  end
end
