class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :show]

  def new
    @line_item = LineItem.where(cart: @cart.id)
    @order = Order.new
  end

  def show
    @order = Order.where(user_id: current_user.id)
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    if @order.save
      redirect_to @order
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:date, :total_price, :payment_method, :user_id)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
