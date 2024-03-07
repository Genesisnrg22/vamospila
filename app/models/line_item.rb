class LineItem < ApplicationRecord
  belongs_to :service
  belongs_to :order, optional: true
  belongs_to :cart, optional: true
end
