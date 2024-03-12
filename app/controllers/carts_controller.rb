class CartsController < ApplicationController
  before_action :set_cart, only: [:show]

  def show
    @line_items = LineItem.where(cart: @cart.id)
  end

  def destroy
    @cart = Cart.find(params[:cart_id])
    @line_items = LineItem.where(cart: @cart.id)
    @line_items.destroy_all
    redirect_to root_path, status: :see_other
  end
end
