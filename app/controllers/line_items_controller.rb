class LineItemsController < ApplicationController
  skip_before_action :authenticate_user!
  include CurrentCart
  before_action :set_cart, only: [:create, :index, :minus, :add, :destroy]

  def index
    # cart = @cart
    # @line_items = LineItem.all
    # if current_user.id
    #   @line_items = LineItem.where(cart: cart.id)
    # #else
    #   #@line_items = LineItem.where(cart: @cart)
    # end
  end

  def new
    @service = set_service
    @line_item = LineItem.new
  end

  def create
    @service = Service.find(params[:service_id].to_i)
    @line_item = LineItem.new(service: @service, qtty: line_item_params[:qtty], cart: @cart, price: @service.price)
    if @line_item.save
      redirect_to @cart
    else
      render "services/show", status: :unprocessable_entity
    end
  end

  def show
    @line_item = LineItem.find(params[:item_id])
    @photo = @line_item.photo
  end

  def minus
    @line_item = LineItem.find(params[:item_id])
    @line_item.qtty -= 1 if @line_item.qtty > 1
    @line_item.save!
    redirect_to @cart, status: :see_other
  end

  def add
    @line_item = LineItem.find(params[:item_id])
    @line_item.qtty += 1 if @line_item.qtty < 10
    @line_item.save!
    redirect_to @cart, status: :see_other
  end

  def destroy
    @line_item = LineItem.find(params[:item_id])
    @line_item.destroy

    redirect_to @cart, status: :see_other
  end

  def order_line_items(order)
    @line_items = LineItem.where(cart_id: session[:cart_id])
    @line_items.each do |line_item|
      line_item.order_id = order.id
    end
  end

  private

  def line_item_params
    params.require(:line_item).permit(:qtty, :service_id)
  end

end
