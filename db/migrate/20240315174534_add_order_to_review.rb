class AddOrderToReview < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :order, null: false, foreign_key: true
  end
end
