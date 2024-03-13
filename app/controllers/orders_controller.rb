class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :show]

  def new
    @line_item = LineItem.where(cart: @cart.id)
    @order = Order.new
  end

  def show
    @order = set_order
  end

  def user_orders
    @orders = Order.where(user_id: current_user.id)
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.date = Date.today
    order_line_items(@order)
    if @order.save
      delete_cart
      redirect_to order_path(@order)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:total_price)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
