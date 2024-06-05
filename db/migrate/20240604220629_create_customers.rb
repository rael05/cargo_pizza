class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :last_name
      t.text :address
      t.string :mail
      t.string :phone, limit: 8

      t.timestamps
    end
  end
end
