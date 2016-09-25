class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points do |t|
      t.integer :trek_id
      t.boolean :start
      t.boolean :end
      t.decimal :latitude, precision: 10, scale: 7
      t.integer :longitue, precision: 10, scale: 7

      t.timestamps
    end
  end
end
