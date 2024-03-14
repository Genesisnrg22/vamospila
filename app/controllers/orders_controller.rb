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
    @line_items = LineItem.where(cart_id: session[:cart_id])
    @order.payment_method = "Tarjeta de crédito"
    if @order.save
      @line_items.each do |line_item|
        line_item.order_id = @order.id
        line_item.save
      end
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
