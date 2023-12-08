class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :customer_id, null: false
      t.time :check_in_time, null: false
      t.time :check_out_time, null: false
      t.date :check_in, null: false
      t.date :check_out, null: false
      t.integer :total_price, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :payment_day, null: false, default: 0
      t.integer :booking_status, null: false, default: 0
      t.integer :payment_status, null: false,default: 0
      t.timestamps
    end
  end
end
