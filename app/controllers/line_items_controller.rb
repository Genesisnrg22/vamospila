class LineItemsController < ApplicationController
  skip_before_action :authenticate_user!
  include CurrentCart
  before_action :set_cart, only: create
end
