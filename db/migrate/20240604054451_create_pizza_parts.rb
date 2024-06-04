class CreatePizzaParts < ActiveRecord::Migration[7.1]
  def change
    create_table :pizza_parts do |t|
      t.string :name
      t.text :description
      t.decimal :price, null: false
      t.string :category, limit: 1, null: false

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        PizzaPart.create_translation_table! :name => :string, :description => :text
      end

      dir.down do
        PizzaPart.drop_translation_table!
      end
    end
  end
end
