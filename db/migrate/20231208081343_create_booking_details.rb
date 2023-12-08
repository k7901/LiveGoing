class CreateBookingDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_details do |t|
      t.integer :booking_id, null: false
      t.integer :room_id, null: false
      t.integer :amount, null: false
      t.integer :guest, null: false
      t.integer :stay_status, null: false, default: 0
      t.timestamps
    end
  end
end
