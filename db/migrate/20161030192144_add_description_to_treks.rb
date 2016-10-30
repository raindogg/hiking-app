class AddDescriptionToTreks < ActiveRecord::Migration[5.0]
  def change
    add_column :treks, :description, :text
  end
end
