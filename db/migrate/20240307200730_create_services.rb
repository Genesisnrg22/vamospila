class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :title
      t.float :price
      t.float :rating
      t.text :description
      t.string :address
      t.float :longitude
      t.float :latitude
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.string :service_type

      t.timestamps
    end
  end
end
