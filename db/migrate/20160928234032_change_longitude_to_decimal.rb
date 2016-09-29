class ChangeLongitudeToDecimal < ActiveRecord::Migration[5.0]
  def change
    change_column :points, :longitude, :decimal, precision: 10, scale: 7
  end
end
