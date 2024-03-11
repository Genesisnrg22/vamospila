class LineItemsController < ApplicationController
  skip_before_action :authenticate_user!
  include CurrentCart
  before_action :set_cart, only: [:create, :index, :minus, :add]

  def index
    cart = @cart
    @line_items = LineItem.all
    if current_user.id
      @line_items = LineItem.where(cart: cart.id)
    #else
      #@line_items = LineItem.where(cart: @cart)
    end
  end

  def new
    @service = set_service
    @line_item = LineItem.new
  end

  def create
    @service = Service.find(params[:service_id].to_i)
    @line_item = LineItem.create(service: @service, qtty: line_item_params[:qtty], cart: @cart, price: @service.price)
    redirect_to cart_path(@cart)
  end

  def show
    @line_item = set_line_item
    @photo = @line_item.photo
  end

  def minus
    @line_item = LineItem.find(params[:item_id])
    @line_item.qtty -= 1 if @line_item.qtty > 1
    @line_item.save!
    redirect_to @cart
  end

  def add
    @line_item = LineItem.find(params[:item_id])
    @line_item.qtty += 1 if @line_item.qtty < 10
    @line_item.save!
    redirect_to @cart
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    redirect_to @line_item, status: :see_other
  end

  private

  def line_item_params
    params.require(:line_item).permit(:qtty, :service_id)
  end

end
