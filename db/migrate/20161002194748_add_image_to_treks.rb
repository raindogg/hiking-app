class AddImageToTreks < ActiveRecord::Migration[5.0]
  def up
    add_attachment :treks, :image
  end

  def down
    remove_attachment :treks, :image
  end
end
