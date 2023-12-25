class CreateHotels < ActiveRecord::Migration[6.1]
  def change
    create_table :hotels do |t|
      t.integer :venue_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :address, null: false
      t.string :star
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false
      t.time :check_in_time_start, null: false
      t.time :check_in_time_end, null: false
      t.time :check_out_time, null: false
      t.timestamps
    end
  end
end
