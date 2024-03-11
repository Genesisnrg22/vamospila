class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:show]

  def show
    @line_item = LineItem.where(cart: @cart.id)
  end
end
