class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :food_id
      t.integer :smell_strong, null: false, default: 5
      t.integer :taste_strong, null: false, default: 5
      t.float   :taste_score, null: false
      t.text    :body
      t.boolean :repeat, null: false, default: true

      t.integer :sweet_like
      t.integer :salty_like
      t.integer :bitter_like
      t.integer :sour_like
      t.integer :spicy_like

      t.timestamps
    end
  end
end
