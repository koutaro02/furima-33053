class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product, null: false
      t.text :product_explain, null: false
      t.integer :category_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :burden_id, null: false
      t.integer :area_id, null: false
      t.integer :delivery_time_id, null: false
      t.integer :price, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
