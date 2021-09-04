class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.integer :genre_id
      t.integer :shop_id
      t.integer :taste
      t.string  :name, null: false
      t.string  :image_id, null: false
      t.text    :introduction, null: false
      t.integer :price, null: false
      t.integer :calorie
      t.integer :status, null: false, default: 0
      t.date    :sale_dates
      t.integer :food_temperature, null: false, default: 0

      t.timestamps
    end
  end
end
