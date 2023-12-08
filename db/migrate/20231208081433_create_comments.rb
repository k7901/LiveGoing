class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :customer_id, null: false
      t.integer :hotel_id, null: false
      t.text :comment, null: false
      t.string :star, null: false
      t.timestamps
    end
  end
end
