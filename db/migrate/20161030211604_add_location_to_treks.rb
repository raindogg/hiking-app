class AddLocationToTreks < ActiveRecord::Migration[5.0]
  def change
    add_column :treks, :location, :string
  end
end
