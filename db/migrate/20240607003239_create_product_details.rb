class CreateProductDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :product_details do |t|
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.float :unit_price
      t.integer :quantity
      t.float :sub_total

      t.timestamps
    end
  end
end
