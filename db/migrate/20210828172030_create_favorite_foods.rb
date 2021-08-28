class CreateFavoriteFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_foods do |t|
      t.integer :user_id
      t.integer :food_id

      t.timestamps
    end
  end
end
