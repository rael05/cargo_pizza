class CreatePizzaDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :pizza_details do |t|
      t.references :pizza_part, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.float :unit_price
      t.float :quantity
      t.float :sub_total

      t.timestamps
    end
  end
end
