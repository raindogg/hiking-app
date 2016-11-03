class CreateTrekCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :trek_categories do |t|
      t.integer :trek_id
      t.integer :category_id

      t.timestamps
    end
  end
end
