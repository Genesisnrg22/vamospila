class Review < ApplicationRecord
  belongs_to :service
  belongs_to :order
  validates :comment, presence: true
  validates :service_id, uniqueness: { scope: :order_id }
end
