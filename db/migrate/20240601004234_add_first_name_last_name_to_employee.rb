class AddFirstNameLastNameToEmployee < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :first_name, :string, null: false
    add_column :employees, :last_name, :string, null: false
    add_column :employees, :phone, :string, limit: 8
  end
end
