class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.float :evaluation, null: false
      t.integer :category_id, null: false
      t.string :shop_name
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
