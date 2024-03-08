class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string, default: "", null: false
    add_column :users, :last_name, :string, default: "", null: false
    add_column :users, :phone, :string, default: "", null: false
    add_column :users, :dni, :string, default: "", null: false
    add_column :users, :nationality, :string
    add_column :users, :address, :text
  end
end
