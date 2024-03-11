class LineItemsController < ApplicationController
  skip_before_action :authenticate_user!
  include CurrentCart
  before_action :set_cart, only: [:create, :index]

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
    redirect_to @service
  end

  def show
    @line_item = set_line_item
    @photo = @line_item.photo
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
