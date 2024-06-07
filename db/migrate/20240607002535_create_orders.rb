class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.float :total
      t.string :status, limit: 1, default: 'P'

      t.timestamps
    end
  end
end
