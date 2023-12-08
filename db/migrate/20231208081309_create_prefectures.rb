class CreatePrefectures < ActiveRecord::Migration[6.1]
  def change
    create_table :prefectures do |t|
      t.integer :region_id, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
