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
      t.float   :sweet_like,  null: false, default: 2.5, array: true
      t.float   :salty_like,  null: false, default: 2.5, array: true
      t.float   :bitter_like, null: false, default: 2.5, array: true
      t.float   :sour_like,   null: false, default: 2.5, array: true
      t.float   :spicy_like,  null: false, default: 2.5, array: true

      t.timestamps
    end
    add_index :foods, :sweet_like, using: 'gin'
    add_index :foods, :salty_like, using: 'gin'
    add_index :foods, :bitter_like, using: 'gin'
    add_index :foods, :sour_like, using: 'gin'
    add_index :foods, :spicy_like, using: 'gin'
  end
end
