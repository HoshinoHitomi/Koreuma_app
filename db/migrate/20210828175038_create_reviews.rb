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

      t.timestamps
    end
  end
end
