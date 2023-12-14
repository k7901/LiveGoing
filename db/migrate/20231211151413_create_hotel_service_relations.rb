class CreateHotelServiceRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :hotel_service_relations do |t|
      t.integer :hotel_id, null: false
      t.integer :service_id, null: false
      t.timestamps
    end
  end
end
