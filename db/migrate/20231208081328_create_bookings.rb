class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :customer_id, null: false
      t.integer :room_id, null: false
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :email,null: false
      t.string :telephone_number, null: false
      t.integer :guest, null: false
      t.integer :amount, null: false
      t.date :check_in_date, null: false
      t.date :check_out_date, null: false
      t.integer :price, null: false
      t.integer :booking_status, null: false, default: 0
      t.integer :payment_status, null: false,default: 0
      t.timestamps
    end
  end
end
