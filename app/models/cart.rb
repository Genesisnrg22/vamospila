class Cart < ApplicationRecord
  has_many :line_items
end
