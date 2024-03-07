class CreateLineItems < ActiveRecord::Migration[7.1]
  def change
    create_table :line_items do |t|
      t.float :price
      t.integer :qtty
      t.references :service, null: false, foreign_key: true
      t.references :order, null: true, foreign_key: true
      t.references :cart, null: true, foreign_key: true

      t.timestamps
    end
  end
end
