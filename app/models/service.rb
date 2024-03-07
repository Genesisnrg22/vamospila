class Service < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :line_items
end
