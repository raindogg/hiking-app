class CreateTreks < ActiveRecord::Migration[5.0]
  def change
    create_table :treks do |t|
      t.integer :user_id
      t.string  :title
      t.integer :length
      t.boolean :public

      t.timestamps
    end
  end
end
