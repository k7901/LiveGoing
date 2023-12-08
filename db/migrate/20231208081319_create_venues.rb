class CreateVenues < ActiveRecord::Migration[6.1]
  def change
    create_table :venues do |t|
      t.integer :prefecture_id, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false
      t.timestamps
    end
  end
end
