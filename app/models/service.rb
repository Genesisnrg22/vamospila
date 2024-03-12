class Service < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :line_items
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
