class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :hotel_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.text :checklist, null: false
      t.integer :price, null: false
      t.integer :amount, null: false
      t.integer :guest, null: false
      t.timestamps
    end
  end
end
