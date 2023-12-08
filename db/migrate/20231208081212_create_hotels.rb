class CreateHotels < ActiveRecord::Migration[6.1]
  def change
    create_table :hotels do |t|
      t.integer :venue_id, null: false
      t.integer :service_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :address, null: false
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false
      t.timestamps
    end
  end
end
